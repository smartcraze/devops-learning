# argocd-demos
Demos of arogcd one shot video

> [!IMPORTANT]
> 
> change `server: https://172.31.19.178:33893` line with your cluster server url in all Application CRDs, in dirctories: `declarative_approach/online_shop` (online_shop_app.yml), `app_of_apps/apps` (apache_app.yml, nginx_app.yml, online_shop_app.yml), `
> You can get it by running `argocd cluster list`

# 1. Prerequisites (must-have)

Install these first:

* Docker
* kubectl
* kind
* Argo CD CLI

Verify:

```bash
docker --version
kubectl version --client
kind version
argocd version
```

---

# 2. Create Local Kubernetes Cluster (kind)

```bash
kind create cluster --name argocd-cluster
```

Check cluster:

```bash
kubectl cluster-info
```

---

# 3. Install Argo CD in cluster

Create namespace:

```bash
kubectl create namespace argocd
```

Install ArgoCD:

```bash
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

Wait for pods:

```bash
kubectl get pods -n argocd
```

You should see all pods **Running**.

---

# 4. Access Argo CD UI (Important)

Since this is local → use port forwarding:

```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

Now open:

```
https://localhost:8080
```

---

# 5. Get Admin Password

```bash
kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 --decode
```

Login:

* Username: `admin`
* Password: (from above)

---

# 6. Login via CLI (optional but important for DevOps)

```bash
argocd login localhost:8080
```

Use:

* username: admin
* password: same as above
* accept insecure connection

---

# 7. Deploy Your First App (Real Dev Workflow)

Example:

```bash
argocd app create guestbook \
  --repo https://github.com/argoproj/argocd-example-apps.git \
  --path guestbook \
  --dest-server https://kubernetes.default.svc \
  --dest-namespace default
```

Sync app:

```bash
argocd app sync guestbook
```

---

# 8. Why this matters (placement perspective)

This setup teaches:

* GitOps workflow (VERY important for DevOps roles)
* Kubernetes deployment automation
* Real industry tool (ArgoCD is widely used)

---

# 9. Common Problems (you already faced some)

### ❌ UI not opening

Fix:

```bash
kubectl get svc -n argocd
```

Make sure port-forward is running

---

### ❌ Pods not running

```bash
kubectl describe pod <pod-name> -n argocd
```

---

### ❌ App not accessible

You likely need:

```bash
kubectl port-forward svc/<service-name> 8081:80
```

---
