# Complete Kubernetes Local Development Guide

## Table of Contents
1. [Installation](#installation)
2. [Local Cluster Setup](#cluster-setup)
3. [Basic Commands](#basic-commands)
4. [Advanced Commands](#advanced-commands)
5. [Cluster Management](#cluster-management)
6. [Common Workflows](#workflows)
7. [Tips and Tricks](#tips)
8. [Troubleshooting](#troubleshooting)

## Installation <a name="installation"></a>

### kubectl Installation

#### Windows
```powershell
# Using Chocolatey
choco install kubernetes-cli

# Manual Installation
# 1. Download kubectl.exe
curl -LO "https://dl.k8s.io/release/v1.28.0/bin/windows/amd64/kubectl.exe"

# 2. Add to PATH
$env:PATH += ';C:\path\to\kubectl'

# Verify installation
kubectl version --client
```

#### macOS
```bash
# Using Homebrew
brew install kubectl

# Using curl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
```

#### Linux
```bash
# Using apt (Ubuntu/Debian)
sudo apt-get update
sudo apt-get install -y kubectl

# Using curl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
```

### kind Installation (Kubernetes in Docker)

#### Windows
```powershell
# Using Chocolatey
choco install kind

# Using curl
curl.exe -Lo kind-windows-amd64.exe https://kind.sigs.k8s.io/dl/v0.20.0/kind-windows-amd64
Move-Item .\kind-windows-amd64.exe c:\path\to\kind.exe
```

#### macOS
```bash
# Using Homebrew
brew install kind

# Using curl
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-darwin-amd64
chmod +x ./kind
mv ./kind /usr/local/bin/kind
```

#### Linux
```bash
# Using curl
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
```

### minikube Installation

#### Windows
```powershell
# Using Chocolatey
choco install minikube

# Using direct download
New-Item -Path 'c:\' -Name 'minikube' -ItemType Directory
Invoke-WebRequest -OutFile 'c:\minikube\minikube.exe' -Uri 'https://github.com/kubernetes/minikube/releases/latest/download/minikube-windows-amd64.exe'
Add-MemberPath 'c:\minikube'
```

#### macOS
```bash
# Using Homebrew
brew install minikube

# Using curl
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64
sudo install minikube-darwin-amd64 /usr/local/bin/minikube
```

#### Linux
```bash
# Using curl
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

## Local Cluster Setup <a name="cluster-setup"></a>

### Using kind

#### Create Cluster
```bash
# Basic cluster
kind create cluster --name my-cluster

# Multi-node cluster
cat <<EOF | kind create cluster --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: worker
- role: worker
EOF
```

#### kind Configuration
```yaml
# kind-config.yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
    protocol: TCP
  - containerPort: 443
    hostPort: 443
    protocol: TCP
- role: worker
networking:
  podSubnet: "10.244.0.0/16"
  serviceSubnet: "10.96.0.0/12"
```

### Using minikube

#### Start Cluster
```bash
# Basic start
minikube start

# With specific Kubernetes version
minikube start --kubernetes-version=v1.28.0

# With more resources
minikube start --cpus=4 --memory=8192mb

# With specific driver
minikube start --driver=docker
```

#### Addons
```bash
# List addons
minikube addons list

# Enable addons
minikube addons enable ingress
minikube addons enable dashboard
minikube addons enable metrics-server
```

## Basic Commands <a name="basic-commands"></a>

### Context and Configuration
```bash
# View kubeconfig
kubectl config view

# Get current context
kubectl config current-context

# Switch context
kubectl config use-context my-cluster

# Set namespace preference
kubectl config set-context --current --namespace=my-namespace
```

### Pod Operations
```bash
# Create pod
kubectl run nginx --image=nginx

# List pods
kubectl get pods
kubectl get pods -o wide
kubectl get pods --all-namespaces

# Pod details
kubectl describe pod <pod-name>

# Pod logs
kubectl logs <pod-name>
kubectl logs -f <pod-name>  # Follow logs
kubectl logs -p <pod-name>  # Previous container logs

# Execute command in pod
kubectl exec -it <pod-name> -- /bin/bash

# Delete pod
kubectl delete pod <pod-name>
```

### Deployment Operations
```bash
# Create deployment
kubectl create deployment nginx --image=nginx

# Scale deployment
kubectl scale deployment nginx --replicas=3

# Update image
kubectl set image deployment/nginx nginx=nginx:1.19

# Rollout commands
kubectl rollout status deployment/nginx
kubectl rollout history deployment/nginx
kubectl rollout undo deployment/nginx
kubectl rollout undo deployment/nginx --to-revision=2

# Delete deployment
kubectl delete deployment nginx
```

### Service Operations
```bash
# Create service
kubectl expose deployment nginx --port=80 --type=LoadBalancer

# List services
kubectl get services
kubectl get svc

# Delete service
kubectl delete service nginx
```

## Advanced Commands <a name="advanced-commands"></a>

### Resource Management
```bash
# Apply manifests
kubectl apply -f manifest.yaml
kubectl apply -f ./directory/
kubectl apply -k ./kustomize/

# Delete resources
kubectl delete -f manifest.yaml
kubectl delete -k ./kustomize/

# Resource editing
kubectl edit deployment nginx
kubectl patch deployment nginx -p '{"spec": {"replicas": 3}}'
```

### Debugging
```bash
# Port forwarding
kubectl port-forward pod/nginx-pod 8080:80
kubectl port-forward svc/nginx-service 8080:80

# Proxy
kubectl proxy --port=8080

# Resource usage
kubectl top pods
kubectl top nodes

# Events
kubectl get events --sort-by=.metadata.creationTimestamp
```

### Resource Types and Documentation
```bash
# API resources
kubectl api-resources

# Explain resource
kubectl explain pod
kubectl explain pod.spec
kubectl explain deployment.spec.strategy

# Create resource templates
kubectl create deployment nginx --image=nginx --dry-run=client -o yaml
```

## Cluster Management <a name="cluster-management"></a>

### Node Operations
```bash
# List nodes
kubectl get nodes
kubectl get nodes -o wide

# Node details
kubectl describe node <node-name>

# Drain node
kubectl drain <node-name> --ignore-daemonsets

# Cordon/Uncordon
kubectl cordon <node-name>
kubectl uncordon <node-name>
```

### Namespace Operations
```bash
# Create namespace
kubectl create namespace my-namespace

# List namespaces
kubectl get namespaces

# Delete namespace
kubectl delete namespace my-namespace
```

### Resource Quotas
```bash
# Create quota
kubectl create quota my-quota --hard=cpu=1,memory=1G,pods=2

# List quotas
kubectl get resourcequota

# Describe quota
kubectl describe resourcequota my-quota
```

## Common Workflows <a name="workflows"></a>

### Application Deployment
```bash
# 1. Create namespace
kubectl create namespace myapp

# 2. Create ConfigMap/Secrets
kubectl create configmap app-config --from-file=config.yaml
kubectl create secret generic app-secrets --from-literal=api_key=123456

# 3. Deploy application
kubectl apply -f deployment.yaml

# 4. Create service
kubectl apply -f service.yaml

# 5. Check status
kubectl get all -n myapp
```

### Backup and Restore
```bash
# Backup resources
kubectl get all --all-namespaces -o yaml > backup.yaml

# Backup etcd
ETCDCTL_API=3 etcdctl snapshot save snapshot.db

# Restore etcd
ETCDCTL_API=3 etcdctl snapshot restore snapshot.db
```

## Tips and Tricks <a name="tips"></a>

### Aliases and Functions
```bash
# Useful aliases
alias k=kubectl
alias kg='kubectl get'
alias kd='kubectl describe'
alias kdf='kubectl delete -f'
alias kaf='kubectl apply -f'

# Watch resources
watch kubectl get pods

# JSON path queries
kubectl get pods -o jsonpath='{.items[*].metadata.name}'
```

### Development Workflow
```bash
# Live reload with skaffold
skaffold dev

# Debug with telepresence
telepresence intercept <service-name>

# Local registry
docker run -d -p 5000:5000 --name registry registry:2
```

## Troubleshooting <a name="troubleshooting"></a>

### Common Issues

#### Pod Issues
```bash
# Check pod status
kubectl get pod <pod-name> -o yaml
kubectl describe pod <pod-name>

# Check logs
kubectl logs <pod-name> --previous
kubectl logs <pod-name> -c <container-name>

# Check events
kubectl get events --sort-by=.metadata.creationTimestamp
```

#### Network Issues
```bash
# DNS debugging
kubectl run dnsutils --image=gcr.io/kubernetes-e2e-test-images/dnsutils --command -- sleep 3600
kubectl exec -it dnsutils -- nslookup kubernetes.default

# Network debugging
kubectl run netshoot --rm -i --tty --image nicolaka/netshoot -- /bin/bash
```

#### Cluster Issues
```bash
# Check component status
kubectl get componentstatuses

# Check cluster info
kubectl cluster-info
kubectl cluster-info dump

# Node diagnostics
kubectl describe node <node-name>
```

### Recovery Commands
```bash
# Force delete pod
kubectl delete pod <pod-name> --grace-period=0 --force

# Evict pods
kubectl drain <node-name> --force --ignore-daemonsets

# Reset cluster (minikube)
minikube delete
minikube start

# Reset cluster (kind)
kind delete cluster --name my-cluster
kind create cluster --name my-cluster
``` 