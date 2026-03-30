# Kubernetes Storage and Persistence Guide

## Table of Contents
1. [Storage Concepts](#concepts)
2. [Volumes](#volumes)
3. [Persistent Volumes](#persistent-volumes)
4. [Persistent Volume Claims](#persistent-volume-claims)
5. [Storage Classes](#storage-classes)
6. [Best Practices](#best-practices)
7. [Troubleshooting](#troubleshooting)

## Storage Concepts <a name="concepts"></a>

### Types of Storage
1. **Ephemeral Storage**
   - Temporary storage that exists only as long as the Pod exists
   - Example: emptyDir volume

2. **Persistent Storage**
   - Storage that persists beyond Pod lifecycle
   - Example: PersistentVolume (PV)

3. **Dynamic Provisioning**
   - Automatically create storage resources when needed
   - Uses StorageClass

## Volumes <a name="volumes"></a>

### EmptyDir
Temporary storage that's erased when Pod is deleted.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: empty-dir-demo
spec:
  containers:
  - name: web
    image: nginx
    volumeMounts:
    - name: cache-volume
      mountPath: /cache
  volumes:
  - name: cache-volume
    emptyDir: {}
```

### HostPath
Mounts a file or directory from the host node's filesystem.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: hostpath-demo
spec:
  containers:
  - name: test-container
    image: nginx
    volumeMounts:
    - name: test-volume
      mountPath: /test-data
  volumes:
  - name: test-volume
    hostPath:
      path: /data
      type: Directory
```

### ConfigMap as Volume
Mount ConfigMap data as files.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: configmap-pod
spec:
  containers:
  - name: test
    image: nginx
    volumeMounts:
    - name: config-vol
      mountPath: /etc/config
  volumes:
  - name: config-vol
    configMap:
      name: my-config
```

## Persistent Volumes <a name="persistent-volumes"></a>

### Basic PV Definition
```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-example
spec:
  capacity:
    storage: 10Gi
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  storageClassName: standard
  nfs:
    path: /path/to/data
    server: nfs-server.example.com
```

### AWS EBS Example
```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: ebs-pv
spec:
  capacity:
    storage: 100Gi
  accessModes:
    - ReadWriteOnce
  awsElasticBlockStore:
    volumeID: vol-xxxxx
    fsType: ext4
```

### Azure Disk Example
```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: azure-pv
spec:
  capacity:
    storage: 100Gi
  accessModes:
    - ReadWriteOnce
  azureDisk:
    diskName: myAzureDisk
    diskURI: /subscriptions/.../diskURI
    kind: Managed
    fsType: ext4
```

## Persistent Volume Claims <a name="persistent-volume-claims"></a>

### Basic PVC Definition
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-example
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 10Gi
  storageClassName: standard
```

### Using PVC in Pod
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pvc-pod
spec:
  containers:
  - name: app
    image: nginx
    volumeMounts:
    - name: data-volume
      mountPath: /data
  volumes:
  - name: data-volume
    persistentVolumeClaim:
      claimName: pvc-example
```

## Storage Classes <a name="storage-classes"></a>

### Default StorageClass
```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: standard
  annotations:
    storageclass.kubernetes.io/is-default-class: "true"
provisioner: kubernetes.io/aws-ebs
parameters:
  type: gp2
reclaimPolicy: Delete
allowVolumeExpansion: true
```

### Custom StorageClass
```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: fast
provisioner: kubernetes.io/aws-ebs
parameters:
  type: io1
  iopsPerGB: "10"
  encrypted: "true"
```

## Best Practices <a name="best-practices"></a>

1. **Storage Planning**
```yaml
# Use appropriate storage class
spec:
  storageClassName: "fast"  # For performance-critical workloads

# Set appropriate access modes
accessModes:
  - ReadWriteOnce  # For single-node access
  - ReadOnlyMany   # For read-only shared access
  - ReadWriteMany  # For shared access
```

2. **Resource Management**
```yaml
# Set appropriate requests and limits
resources:
  requests:
    storage: 10Gi
  limits:
    storage: 20Gi
```

3. **Data Protection**
```yaml
# Use backup solutions
# Example using Velero backup
apiVersion: velero.io/v1
kind: Backup
metadata:
  name: daily-backup
spec:
  includedNamespaces:
  - default
  storageLocation: default
  volumeSnapshotLocations:
  - default
```

4. **Security**
```yaml
# Enable encryption
spec:
  encrypted: true
  
# Set appropriate permissions
securityContext:
  fsGroup: 1000
```

## Troubleshooting <a name="troubleshooting"></a>

### Common Commands
```bash
# Check PV status
kubectl get pv
kubectl describe pv <pv-name>

# Check PVC status
kubectl get pvc
kubectl describe pvc <pvc-name>

# Check StorageClass
kubectl get sc
kubectl describe sc <storage-class-name>

# Check Pod volume issues
kubectl describe pod <pod-name>
```

### Common Issues

1. **PVC Pending**
```bash
kubectl describe pvc <pvc-name>
# Check for:
# - Storage class availability
# - PV availability
# - Capacity issues
```

2. **Volume Mount Failures**
```bash
kubectl describe pod <pod-name>
# Check for:
# - Volume permissions
# - Mount point issues
# - Storage provider issues
```

3. **Storage Class Issues**
```bash
kubectl get sc
kubectl describe sc <storage-class-name>
# Check for:
# - Provisioner availability
# - Parameter configuration
# - Cloud provider issues
```

### Volume Expansion
```yaml
# Enable volume expansion in StorageClass
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: expandable
allowVolumeExpansion: true

# Expand PVC
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: myclaim
spec:
  resources:
    requests:
      storage: 20Gi  # Increase size
```

### Volume Snapshots
```yaml
# Create VolumeSnapshot
apiVersion: snapshot.storage.k8s.io/v1
kind: VolumeSnapshot
metadata:
  name: my-snapshot
spec:
  volumeSnapshotClassName: csi-hostpath-snapclass
  source:
    persistentVolumeClaimName: myclaim

# Restore from Snapshot
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: restored-pvc
spec:
  dataSource:
    name: my-snapshot
    kind: VolumeSnapshot
    apiGroup: snapshot.storage.k8s.io
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 10Gi
``` 