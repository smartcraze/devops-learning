# Kubernetes Pods and Deployments Guide

## Table of Contents
1. [Pods](#pods)
2. [Deployments](#deployments)
3. [ReplicaSets](#replicasets)
4. [Configuration Strategies](#configuration)
5. [Best Practices](#best-practices)
6. [Troubleshooting](#troubleshooting)

## Pods <a name="pods"></a>

### What is a Pod?
A Pod is the smallest deployable unit in Kubernetes that can be created and managed. It's a group of one or more containers with shared storage/network resources.

### Pod Specifications

#### Basic Pod
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-app
  labels:
    app: web
    tier: frontend
spec:
  containers:
  - name: web-container
    image: nginx:1.21
    ports:
    - containerPort: 80
    resources:
      requests:
        memory: "64Mi"
        cpu: "250m"
      limits:
        memory: "128Mi"
        cpu: "500m"
```

#### Multi-Container Pod
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: multi-container-pod
spec:
  containers:
  - name: web
    image: nginx
    volumeMounts:
    - name: shared-data
      mountPath: /usr/share/nginx/html

  - name: content-sync
    image: debian
    volumeMounts:
    - name: shared-data
      mountPath: /content
    command: ["/bin/sh"]
    args: ["-c", "while true; do date >> /content/index.html; sleep 5; done"]

  volumes:
  - name: shared-data
    emptyDir: {}
```

### Pod Lifecycle
1. Pending
2. Running
3. Succeeded
4. Failed
5. Unknown

### Pod Probes
```yaml
spec:
  containers:
  - name: web
    image: nginx
    livenessProbe:
      httpGet:
        path: /healthz
        port: 80
      initialDelaySeconds: 3
      periodSeconds: 3
    readinessProbe:
      httpGet:
        path: /ready
        port: 80
      initialDelaySeconds: 5
      periodSeconds: 5
    startupProbe:
      httpGet:
        path: /startup
        port: 80
      failureThreshold: 30
      periodSeconds: 10
```

## Deployments <a name="deployments"></a>

### What is a Deployment?
A Deployment provides declarative updates for Pods and ReplicaSets, allowing for easy scaling and rolling updates.

### Deployment Specifications

#### Basic Deployment
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web-deployment
  labels:
    app: web
spec:
  replicas: 3
  selector:
    matchLabels:
      app: web
  template:
    metadata:
      labels:
        app: web
    spec:
      containers:
      - name: nginx
        image: nginx:1.21
        ports:
        - containerPort: 80
```

#### Advanced Deployment
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web-deployment
spec:
  replicas: 5
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 1
  selector:
    matchLabels:
      app: web
  template:
    metadata:
      labels:
        app: web
    spec:
      containers:
      - name: web
        image: nginx:1.21
        resources:
          requests:
            cpu: "100m"
            memory: "128Mi"
          limits:
            cpu: "200m"
            memory: "256Mi"
        readinessProbe:
          httpGet:
            path: /ready
            port: 80
          initialDelaySeconds: 5
          periodSeconds: 5
```

### Deployment Strategies

#### Rolling Update
```yaml
spec:
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
```

#### Recreate
```yaml
spec:
  strategy:
    type: Recreate
```

### Scaling
```bash
# Manual scaling
kubectl scale deployment web-deployment --replicas=5

# Autoscaling
kubectl autoscale deployment web-deployment --min=2 --max=5 --cpu-percent=80
```

## ReplicaSets <a name="replicasets"></a>

### What is a ReplicaSet?
ReplicaSets ensure that a specified number of pod replicas are running at any given time.

### ReplicaSet Specification
```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: web-replicaset
spec:
  replicas: 3
  selector:
    matchLabels:
      app: web
  template:
    metadata:
      labels:
        app: web
    spec:
      containers:
      - name: nginx
        image: nginx:1.21
```

## Configuration Strategies <a name="configuration"></a>

### Environment Variables
```yaml
spec:
  containers:
  - name: web
    image: nginx
    env:
    - name: DATABASE_URL
      value: "mysql://db:3306/myapp"
    - name: API_KEY
      valueFrom:
        secretKeyRef:
          name: app-secrets
          key: api-key
```

### ConfigMaps
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: app-config
data:
  database_url: "mysql://db:3306/myapp"
  api_endpoint: "https://api.example.com"
---
spec:
  containers:
  - name: web
    envFrom:
    - configMapRef:
        name: app-config
```

### Secrets
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: app-secrets
type: Opaque
data:
  username: dXNlcm5hbWU=  # base64 encoded
  password: cGFzc3dvcmQ=  # base64 encoded
---
spec:
  containers:
  - name: web
    volumeMounts:
    - name: secrets
      mountPath: "/etc/secrets"
  volumes:
  - name: secrets
    secret:
      secretName: app-secrets
```

## Best Practices <a name="best-practices"></a>

1. **Resource Management**
```yaml
resources:
  requests:
    memory: "64Mi"
    cpu: "250m"
  limits:
    memory: "128Mi"
    cpu: "500m"
```

2. **Health Checks**
```yaml
livenessProbe:
  httpGet:
    path: /healthz
    port: 80
  initialDelaySeconds: 3
  periodSeconds: 3
```

3. **Labels and Selectors**
```yaml
metadata:
  labels:
    app: web
    environment: production
    version: v1.0.0
```

4. **Security Context**
```yaml
securityContext:
  runAsUser: 1000
  runAsGroup: 3000
  fsGroup: 2000
```

## Troubleshooting <a name="troubleshooting"></a>

### Common Commands
```bash
# Get pod details
kubectl describe pod <pod-name>

# Get pod logs
kubectl logs <pod-name>
kubectl logs -f <pod-name>  # Follow logs

# Execute commands in pod
kubectl exec -it <pod-name> -- /bin/bash

# Check deployment status
kubectl rollout status deployment/<deployment-name>

# Deployment history
kubectl rollout history deployment/<deployment-name>

# Rollback deployment
kubectl rollout undo deployment/<deployment-name>
```

### Common Issues

1. **Pod in Pending State**
```bash
kubectl describe pod <pod-name>
# Check for:
# - Resource constraints
# - PVC binding issues
# - Node selector issues
```

2. **Pod in CrashLoopBackOff**
```bash
kubectl logs <pod-name>
kubectl describe pod <pod-name>
# Check for:
# - Application crashes
# - Resource limits
# - Configuration issues
```

3. **Pod in ImagePullBackOff**
```bash
kubectl describe pod <pod-name>
# Check for:
# - Image name/tag
# - Registry credentials
# - Network connectivity
```

4. **Deployment Not Progressing**
```bash
kubectl rollout status deployment/<deployment-name>
kubectl get events --field-selector involvedObject.kind=Deployment
# Check for:
# - Pod scheduling issues
# - Resource constraints
# - Configuration errors
``` 