# Kubernetes in One Shot

This README is a comprehensive guide for "Kubernetes in One Shot." It contains categorized commands from your history, structured by core Kubernetes topics. Each command is briefly described for ease of understanding and use.

---

## **Core Concepts**

### Monolithic vs Microservices, Kubernetes Architecture

1. `kubectl cluster-info`  
   Display cluster information to understand the Kubernetes architecture.

### Setup On Local/AWS EC2

1. `kind create cluster --name=tws-cluster --config=config.yml`  
   Create a Kubernetes cluster using Kind with a specific configuration.
2. `kubectl config use-context kind-tws-cluster`  
   Switch the context to the Kind cluster.

### Kubectl and Pods

1. `kubectl get nodes`  
   List all nodes in the Kubernetes cluster.
2. `kubectl run nginx --image=nginx -n nginx`  
   Create a pod named nginx in the nginx namespace.
3. `kubectl describe pod nginx -n nginx`  
   Display detailed information about the nginx pod.

### Namespaces, Labels, Selectors, Annotations

1. `kubectl create namespace monitoring`  
   Create a namespace for monitoring resources.
2. `kubectl get namespace`  
   List all namespaces in the cluster.
3. `kubectl label namespace monitoring team=devops`  
   Add a label to the monitoring namespace.
4. `kubectl describe namespace monitoring`  
   Display detailed information about the monitoring namespace.

---

## **Workloads**

### Deployments

1. `kubectl apply -f deployment.yml`  
   Deploy a workload defined in `deployment.yml`.
2. `kubectl scale deployment nginx-deployment --replicas=3 -n nginx`  
   Scale the deployment to 3 replicas.

### StatefulSets

1. `kubectl apply -f statefulset.yml`  
   Deploy a StatefulSet defined in `statefulset.yml`.
2. `kubectl describe statefulset mysql -n database`  
   Display detailed information about a StatefulSet.

### DaemonSets

1. `kubectl apply -f daemonset.yml`  
   Deploy a DaemonSet for running pods on every node.
2. `kubectl describe daemonset fluentd -n logging`  
   Display details about a DaemonSet.

### ReplicaSets

1. `kubectl apply -f replicaset.yml`  
   Deploy a ReplicaSet for managing pod replicas.
2. `kubectl describe replicaset nginx-replicaset -n nginx`  
   Show detailed information about the ReplicaSet.

### Jobs and CronJobs

1. `kubectl apply -f job.yml`  
   Deploy a Job defined in `job.yml`.
2. `kubectl apply -f cronjob.yml`  
   Deploy a CronJob to schedule recurring tasks.

---

## **Networking**

### Cluster Networking

1. `kubectl get svc -A`  
   List all services in the cluster.

### Services

1. `kubectl apply -f service.yml`  
   Expose an application as a service.
2. `kubectl describe svc nginx-service -n nginx`  
   Show details of the nginx service.

### Ingress

1. `kubectl apply -f ingress.yml`  
   Configure an Ingress resource for routing traffic.
2. `kubectl describe ingress nginx-ingress -n nginx`  
   Display details about an Ingress resource.

### Network Policies

1. `kubectl apply -f networkpolicy.yml`  
   Apply network restrictions between pods and services.

---

## **Storage**

### Persistent Volumes (PV), Persistent Volume Claims (PVC)

1. `kubectl apply -f persistentVolume.yml`  
   Create a PersistentVolume.
2. `kubectl apply -f persistentVolumeClaim.yml`  
   Request storage through a PersistentVolumeClaim.

### StorageClasses

1. `kubectl get storageclass`  
   List all storage classes available in the cluster.

### ConfigMaps and Secrets

1. `kubectl create configmap app-config --from-file=config.properties`  
   Create a ConfigMap from a file.
2. `kubectl create secret generic db-credentials --from-literal=username=admin --from-literal=password=admin123`  
   Create a Secret with database credentials.

---

## **Scaling and Scheduling**

### HPA and VPA

1. `kubectl autoscale deployment nginx --cpu-percent=50 --min=1 --max=10 -n nginx`  
   Enable Horizontal Pod Autoscaler (HPA).
2. `kubectl apply -f vpa.yml`  
   Deploy a Vertical Pod Autoscaler (VPA).

### Node Affinity and Taints/Tolerations

1. `kubectl taint nodes node1 key=value:NoSchedule`  
   Apply a taint to a node.
2. `kubectl apply -f node-affinity.yml`  
   Define node affinity rules for pods.

### Resource Quotas, Limits, Probes

1. `kubectl apply -f resourcequota.yml`  
   Set resource limits and quotas in a namespace.
2. `kubectl describe quota my-quota -n dev`  
   Display details of a resource quota.

---

## **Cluster Administration**

### RBAC

1. `kubectl apply -f role.yml`  
   Define a Role for access control.
2. `kubectl apply -f rolebinding.yml`  
   Bind the Role to a user or service account.

### Custom Resource Definitions (CRDs)

1. `kubectl apply -f crd.yml`  
   Define a Custom Resource Definition.
2. `kubectl get crd`  
   List all Custom Resource Definitions.

---

## **Monitoring and Logging**

### Metrics Server

1. `kubectl apply -f metrics-server.yml`  
   Deploy the metrics server.
2. `kubectl top node`  
   Display resource usage by nodes.

### Prometheus and Grafana

1. `helm install prometheus-stack prometheus-community/kube-prometheus-stack --namespace monitoring`  
   Install Prometheus and Grafana for monitoring.
2. `kubectl port-forward svc/prometheus-stack-grafana 3000:80 -n monitoring --address=0.0.0.0`  
   Access Grafana through port forwarding.

---

## **Advanced Features**

### Helm

1. `helm create my-chart`  
   Create a Helm chart.
2. `helm install my-app my-chart -n my-namespace --create-namespace`  
   Deploy an application using a Helm chart.

### SideCar and Init Containers

1. `kubectl apply -f init-container.yml`  
   Deploy a pod with an Init Container.
2. `kubectl apply -f sidecar-container.yml`  
   Deploy a pod with a SideCar Container.

---

## **Security**

1. `kubectl apply -f podsecuritypolicy.yml`  
   Define pod security standards.
2. `kubectl apply -f secrets-encryption.yml`  
   Configure encryption for Kubernetes Secrets.

---

## **Cloud-Native Kubernetes**

### Managed Services (EKS, AKS, GKE)

1. `eksctl create cluster --name my-cluster`  
   Create an EKS cluster using `eksctl`.

### Cluster Autoscaler

1. `kubectl apply -f cluster-autoscaler.yml`  
   Deploy the Cluster Autoscaler.

---

## **Debugging and Troubleshooting**

1. `kubectl logs pod-name -n namespace`  
   View logs for a specific pod.
2. `kubectl describe pod pod-name -n namespace`  
   Display detailed information about a pod.
3. `kubectl exec -it pod-name -n namespace -- bash`  
   Access a running container.

---

## **Projects**

### Resources for Projects:

1. **Kubestarter:** [GitHub Repository](https://github.com/LondheShubham153/kubestarter)  
   A comprehensive starter template for Kubernetes projects.

2. **CI/CD Integration:** [Wanderlust Mega Project](https://github.com/LondheShubham153/Wanderlust-Mega-Project)  
   Learn Kubernetes CI/CD with Jenkins and ArgoCD.

3. **Microservices:** [Full Stack ChatApp](https://github.com/LondheShubham153/full-stack_chatApp)  
   Build and deploy a full-stack chat application.

4. **Monitoring:** [K8s Voting App](https://github.com/LondheShubham153/k8s-kind-voting-app)  
   Implement monitoring with Prometheus and Grafana for a voting app.

