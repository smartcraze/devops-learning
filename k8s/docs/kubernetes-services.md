# Kubernetes Services: Complete Guide

## Table of Contents
1. [Introduction to Kubernetes Services](#introduction)
2. [ClusterIP Service](#clusterip)
3. [NodePort Service](#nodeport)
4. [LoadBalancer Service](#loadbalancer)
5. [ExternalName Service](#externalname)
6. [Headless Service](#headless)
7. [Best Practices](#best-practices)
8. [Troubleshooting](#troubleshooting)

## Introduction to Kubernetes Services <a name="introduction"></a>

A Kubernetes Service is an abstraction that defines a logical set of Pods and a policy to access them. Services enable loose coupling between dependent Pods and can provide service discovery and load balancing.

Key features of Services:
- Load balancing
- Service discovery
- Stable network endpoint
- Automatic updates when Pods change

## ClusterIP Service <a name="clusterip"></a>

### Description
ClusterIP is the default and most common service type. It exposes the service on an internal IP address within the cluster.

### Use Cases
- Internal communication between applications
- Backend services that don't need external access
- Microservices architecture
- Internal APIs

### YAML Example
```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-backend-service
spec:
  type: ClusterIP
  selector:
    app: backend
  ports:
    - protocol: TCP
      port: 80        # Port exposed to the cluster
      targetPort: 8080 # Port your application listens on
```

### How to Access
```bash
# From within the cluster
curl http://my-backend-service.namespace.svc.cluster.local
# Or simply
curl http://my-backend-service

# Using kubectl proxy
kubectl proxy
curl http://localhost:8001/api/v1/namespaces/default/services/my-backend-service/proxy/

# Using port-forward for debugging
kubectl port-forward service/my-backend-service 8080:80
curl http://localhost:8080
```

## NodePort Service <a name="nodeport"></a>

### Description
NodePort exposes the service on each Node's IP at a static port. It creates a ClusterIP service automatically.

### Use Cases
- Development and testing
- When direct access to specific node ports is needed
- On-premises deployments
- When LoadBalancer is not available

### YAML Example
```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-nodeport-service
spec:
  type: NodePort
  selector:
    app: frontend
  ports:
    - protocol: TCP
      port: 80          # Port exposed internally
      targetPort: 8080  # Container port
      nodePort: 30080   # Port exposed on each node (30000-32767)
```

### How to Access
```bash
# Using any node's IP
curl http://<node-ip>:30080

# Using kubectl
kubectl get nodes -o wide # Get node IPs
curl http://<any-node-ip>:30080
```

## LoadBalancer Service <a name="loadbalancer"></a>

### Description
LoadBalancer exposes the service externally using the cloud provider's load balancer. It creates NodePort and ClusterIP services automatically.

### Use Cases
- Production applications requiring external access
- Public-facing services
- Cloud-native applications
- High-availability setups

### YAML Example
```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-loadbalancer
  annotations:
    service.beta.kubernetes.io/aws-load-balancer-type: nlb  # Cloud-specific annotations
spec:
  type: LoadBalancer
  selector:
    app: web
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
  externalTrafficPolicy: Local  # Preserves client source IP
```

### How to Access
```bash
# Get external IP
kubectl get service my-loadbalancer

# Access using external IP
curl http://<external-ip>

# Or using DNS if configured
curl http://my-app.example.com
```

## ExternalName Service <a name="externalname"></a>

### Description
ExternalName maps a service to a DNS name, not to selectors. It's used for service abstraction to external services.

### Use Cases
- Accessing external databases
- Cloud services
- Services in different namespaces/clusters
- Legacy system integration

### YAML Example
```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-database
spec:
  type: ExternalName
  externalName: rds.example.com
```

### How to Access
```bash
# From within the cluster
curl http://my-database.default.svc.cluster.local
# The request will be CNAME redirected to rds.example.com
```

## Headless Service <a name="headless"></a>

### Description
A headless service is created by setting `clusterIP: None`. It returns the IPs of individual Pods instead of load balancing.

### Use Cases
- Stateful applications
- Direct Pod-to-Pod communication
- Custom load balancing
- Service discovery without load balancing

### YAML Example
```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-headless-service
spec:
  clusterIP: None  # Makes this a headless service
  selector:
    app: stateful-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
```

### How to Access
```bash
# DNS lookup will return all Pod IPs
nslookup my-headless-service.default.svc.cluster.local

# Direct Pod access
curl http://pod-name.my-headless-service.default.svc.cluster.local
```

## Best Practices <a name="best-practices"></a>

1. **Service Naming**
   - Use meaningful, descriptive names
   - Follow naming conventions
   - Include purpose in name

2. **Port Configuration**
   - Name ports for clarity
   - Use standard port numbers
   - Document custom ports
```yaml
ports:
  - name: http
    port: 80
    targetPort: http-server
```

3. **Labels and Selectors**
   - Use consistent labeling
   - Keep selectors simple
   - Include app and version labels
```yaml
selector:
  app: myapp
  tier: frontend
  version: v1
```

4. **Security**
   - Limit service exposure
   - Use network policies
   - Configure appropriate RBAC
```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: restrict-service
spec:
  podSelector:
    matchLabels:
      app: protected-service
  ingress:
    - from:
        - namespaceSelector:
            matchLabels:
              environment: production
```

## Troubleshooting <a name="troubleshooting"></a>

1. **Service Discovery Issues**
```bash
# Check service details
kubectl describe service <service-name>

# Check endpoints
kubectl get endpoints <service-name>

# Check DNS resolution
kubectl run -it --rm debug --image=busybox -- nslookup my-service.default.svc.cluster.local
```

2. **Connection Issues**
```bash
# Check if pods are running
kubectl get pods -l app=myapp

# Check service ports
kubectl get service <service-name> -o yaml

# Test connectivity
kubectl exec -it <pod-name> -- curl http://service-name
```

3. **Load Balancer Issues**
```bash
# Check events
kubectl get events --field-selector involvedObject.kind=Service

# Check service status
kubectl describe service <service-name> | grep -i error

# Verify external IP
kubectl get service <service-name> -w
```

4. **Common Commands for Debugging**
```bash
# Port forward for testing
kubectl port-forward service/<service-name> 8080:80

# Check logs
kubectl logs -l app=myapp

# Check service configuration
kubectl get service <service-name> -o yaml
``` 