# 🚀 DevOps Learning Repository

> A hands-on, end-to-end DevOps learning repo — covering Shell Scripting, Docker, Kubernetes, CI/CD, ArgoCD, Terraform, Nginx, Linux, Git and real-world mega projects.

![DevOps](https://img.shields.io/badge/DevOps-Learning-blue?style=for-the-badge&logo=devdotto)
![Shell](https://img.shields.io/badge/Shell-Scripting-green?style=for-the-badge&logo=gnubash)
![Docker](https://img.shields.io/badge/Docker-Containerization-2496ED?style=for-the-badge&logo=docker)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Orchestration-326CE5?style=for-the-badge&logo=kubernetes)
![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC?style=for-the-badge&logo=terraform)
![ArgoCD](https://img.shields.io/badge/ArgoCD-GitOps-EF7B4D?style=for-the-badge&logo=argo)

---

## 📖 Table of Contents

| # | Section | Description |
|---|---------|-------------|
| 1 | [🐚 Shell Scripting for DevOps](#-shell-scripting-for-devops) | Bash scripting from basics to real-world automation |
| 2 | [🐋 Docker](#-docker) | Dockerfiles, Compose, and command references |
| 3 | [☸️ Kubernetes (k8s)](#️-kubernetes-k8s) | Docs, manifests, and local cluster setup |
| 4 | [☸️ Kubernetes in One Shot](#️-kubernetes-in-one-shot) | Complete hands-on Kubernetes reference with YAMLs |
| 5 | [🔄 CI/CD](#-cicd) | GitHub Actions, Jenkins pipelines, and workflows |
| 6 | [🔁 ArgoCD Demos](#-argocd-demos) | GitOps patterns: declarative, app-of-apps, image updater |
| 7 | [🔁 ArgoCD Practice](#-argocd-practice) | Hands-on ArgoCD application manifests |
| 8 | [🏗️ Terraform for DevOps](#️-terraform-for-devops) | Terraform IaC examples from basics to EKS |
| 9 | [🌐 Nginx](#-nginx) | Web server config, reverse proxy, SSL |
| 10 | [🐧 Linux](#-linux) | Bash commands, permissions, networking |
| 11 | [📁 Git](#-git) | Git CLI guide and branching strategies |
| 12 | [🛒 Retail Store Sample App](#-retail-store-sample-app) | Full GitOps project on AWS EKS Auto Mode |
| 13 | [🌍 Wanderlust Mega Project](#-wanderlust-mega-project) | End-to-end DevSecOps + GitOps MERN deployment |
| 14 | [📚 Learning Resources](#-learning-resources) | Curated external resources for each topic |

---

## 🐚 Shell Scripting for DevOps

> **Folder:** [`Shell-Scripting-For-DevOps/`](Shell-Scripting-For-DevOps/)
>
> A complete guide to Bash shell scripting for DevOps engineers — from writing your first script to automating cloud infrastructure. Organized by day-wise practice sessions and batch scripts.

### 📂 Contents

| File / Folder | Description |
|---------------|-------------|
| [README.md](Shell-Scripting-For-DevOps/README.md) | Full curriculum: intro → intermediate → advanced → real-world projects |
| **`day01/`** | |
| [day01/hello.sh](Shell-Scripting-For-DevOps/day01/hello.sh) | First shell script — printing and variables |
| **`day02/`** | |
| [day02/for_loop.sh](Shell-Scripting-For-DevOps/day02/for_loop.sh) | for loops in Bash |
| [day02/while_loop.sh](Shell-Scripting-For-DevOps/day02/while_loop.sh) | while loops in Bash |
| [day02/create_user.sh](Shell-Scripting-For-DevOps/day02/create_user.sh) | Script to create a Linux user |
| [day02/check_if_jetha_loyal.sh](Shell-Scripting-For-DevOps/day02/check_if_jetha_loyal.sh) | Conditional statements example |
| [day02/jetha_lal_ki_duniya.sh](Shell-Scripting-For-DevOps/day02/jetha_lal_ki_duniya.sh) | Fun functions and logic demo |
| **`day03/`** | |
| [day03/error_handle.sh](Shell-Scripting-For-DevOps/day03/error_handle.sh) | Error handling with `set -e`, `trap` |
| [day03/deploy_django_app.sh](Shell-Scripting-For-DevOps/day03/deploy_django_app.sh) | Automate Django app deployment |
| [day03/create_ec2.sh](Shell-Scripting-For-DevOps/day03/create_ec2.sh) | Provision AWS EC2 using AWS CLI |
| **`day04/`** | |
| [day04/create_ec2.sh](Shell-Scripting-For-DevOps/day04/create_ec2.sh) | Advanced EC2 creation script |
| **`batch-10-scripts/`** | |
| [batch-10-scripts/hello.sh](Shell-Scripting-For-DevOps/batch-10-scripts/hello.sh) | Hello world script |
| [batch-10-scripts/functions.sh](Shell-Scripting-For-DevOps/batch-10-scripts/functions.sh) | Functions in shell scripting |
| [batch-10-scripts/for_loops.sh](Shell-Scripting-For-DevOps/batch-10-scripts/for_loops.sh) | For loop patterns |
| [batch-10-scripts/create_user.sh](Shell-Scripting-For-DevOps/batch-10-scripts/create_user.sh) | Create user from script |
| [batch-10-scripts/add_user_from_function.sh](Shell-Scripting-For-DevOps/batch-10-scripts/add_user_from_function.sh) | User creation using functions |
| [batch-10-scripts/error_handling.sh](Shell-Scripting-For-DevOps/batch-10-scripts/error_handling.sh) | Robust error handling patterns |
| [batch-10-scripts/install_packages.sh](Shell-Scripting-For-DevOps/batch-10-scripts/install_packages.sh) | Automate package installation |
| [batch-10-scripts/system_details.sh](Shell-Scripting-For-DevOps/batch-10-scripts/system_details.sh) | Print system info (CPU, RAM, disk) |
| [batch-10-scripts/create_simple_file.sh](Shell-Scripting-For-DevOps/batch-10-scripts/create_simple_file.sh) | File creation automation |
| [batch-10-scripts/if_file_exisits.sh](Shell-Scripting-For-DevOps/batch-10-scripts/if_file_exisits.sh) | File existence check |
| **`log-files/`** | Sample log files for parsing practice |
| [log-files/app.log](Shell-Scripting-For-DevOps/log-files/app.log) | Application log sample |
| [log-files/application.log](Shell-Scripting-For-DevOps/log-files/application.log) | Extended application log |
| [log-files/july-29-warning-logs.log](Shell-Scripting-For-DevOps/log-files/july-29-warning-logs.log) | Warning-level log sample |
| [log-files/zookeeper.log](Shell-Scripting-For-DevOps/log-files/zookeeper.log) | ZooKeeper log for parsing practice |

---

## 🐋 Docker

> **Folder:** [`docker/`](docker/)
>
> Comprehensive documentation on writing Dockerfiles, using Docker Compose, and mastering Docker CLI commands. Each guide includes best practices, real examples, and security tips.

### 📂 Contents

| File | Description |
|------|-------------|
| [docker/dockerfile-guide.md](docker/dockerfile-guide.md) | Writing Dockerfiles — basic to multi-stage, security, optimization |
| [docker/compose-guide.md](docker/compose-guide.md) | Docker Compose — services, volumes, networks, env variables |
| [docker/commands-guide.md](docker/commands-guide.md) | Complete Docker CLI reference — containers, images, networks, volumes |

---

## ☸️ Kubernetes (k8s)

> **Folder:** [`k8s/`](k8s/)
>
> Structured Kubernetes documentation covering pods, deployments, services, storage, and local development setup. Also contains self-exploration YAML manifests for hands-on practice.

### 📂 Docs

| File | Description |
|------|-------------|
| [k8s/docs/local-development-setup.md](k8s/docs/local-development-setup.md) | Install kubectl, kind, minikube; create local clusters |
| [k8s/docs/pods.md](k8s/docs/pods.md) | Pod concepts, lifecycle, and YAML spec |
| [k8s/docs/pods-and-deployments.md](k8s/docs/pods-and-deployments.md) | Deployment strategies, ReplicaSets, rollouts |
| [k8s/docs/Deployment.md](k8s/docs/Deployment.md) | In-depth Deployment resource guide |
| [k8s/docs/kubernetes-services.md](k8s/docs/kubernetes-services.md) | ClusterIP, NodePort, LoadBalancer, Headless services |
| [k8s/docs/storage-and-persistence.md](k8s/docs/storage-and-persistence.md) | PV, PVC, StorageClass, cloud provider storage |
| [k8s/docs/manifest.md](k8s/docs/manifest.md) | Writing and structuring Kubernetes manifests |
| [k8s/docs/end-end.md](k8s/docs/end-end.md) | End-to-end deployment walkthrough |

### 📂 Self-Explore Manifests

| File | Description |
|------|-------------|
| [k8s/self-explore/cluster.yml](k8s/self-explore/cluster.yml) | Kind cluster config |
| [k8s/self-explore/manifest.yml](k8s/self-explore/manifest.yml) | General manifest practice |
| [k8s/self-explore/deployment.yml](k8s/self-explore/deployment.yml) | Sample Deployment |
| [k8s/self-explore/rs.yml](k8s/self-explore/rs.yml) | ReplicaSet definition |
| [k8s/self-explore/svc.yml](k8s/self-explore/svc.yml) | Service definition |

---

## ☸️ Kubernetes in One Shot

> **Folder:** [`kubernetes-in-one-shot/`](kubernetes-in-one-shot/)
>
> A comprehensive, categorized collection of `kubectl` commands and real YAML manifests covering every major Kubernetes topic — from core workloads to RBAC, Helm, monitoring, and custom resource definitions (CRDs). Ideal for interview prep and hands-on learning.

### 📂 Contents

| File / Folder | Description |
|---------------|-------------|
| [README.md](kubernetes-in-one-shot/README.md) | Complete kubectl command reference by topic |
| **`nginx/`** | Nginx workloads on Kubernetes |
| [nginx/pod.yml](kubernetes-in-one-shot/nginx/pod.yml) | Basic nginx Pod |
| [nginx/deployment.yml](kubernetes-in-one-shot/nginx/deployment.yml) | Nginx Deployment |
| [nginx/replicasets.yml](kubernetes-in-one-shot/nginx/replicasets.yml) | Nginx ReplicaSet |
| [nginx/service.yml](kubernetes-in-one-shot/nginx/service.yml) | Nginx Service |
| [nginx/namespace.yml](kubernetes-in-one-shot/nginx/namespace.yml) | Namespace for nginx |
| [nginx/ingress.yml](kubernetes-in-one-shot/nginx/ingress.yml) | Ingress resource |
| [nginx/daemonsets.yml](kubernetes-in-one-shot/nginx/daemonsets.yml) | DaemonSet example |
| [nginx/job.yml](kubernetes-in-one-shot/nginx/job.yml) | Kubernetes Job |
| [nginx/cron-job.yml](kubernetes-in-one-shot/nginx/cron-job.yml) | CronJob example |
| [nginx/persistentVolume.yml](kubernetes-in-one-shot/nginx/persistentVolume.yml) | PersistentVolume |
| [nginx/persistentVolumeClaim.yml](kubernetes-in-one-shot/nginx/persistentVolumeClaim.yml) | PersistentVolumeClaim |
| **`apache/`** | Apache workloads with autoscaling and RBAC |
| [apache/deployment.yml](kubernetes-in-one-shot/apache/deployment.yml) | Apache Deployment |
| [apache/service.yml](kubernetes-in-one-shot/apache/service.yml) | Apache Service |
| [apache/namespace.yml](kubernetes-in-one-shot/apache/namespace.yml) | Namespace |
| [apache/hpa.yml](kubernetes-in-one-shot/apache/hpa.yml) | Horizontal Pod Autoscaler |
| [apache/vpa.yml](kubernetes-in-one-shot/apache/vpa.yml) | Vertical Pod Autoscaler |
| [apache/role.yml](kubernetes-in-one-shot/apache/role.yml) | RBAC Role |
| [apache/role-binding.yml](kubernetes-in-one-shot/apache/role-binding.yml) | RBAC RoleBinding |
| [apache/service-account.yml](kubernetes-in-one-shot/apache/service-account.yml) | ServiceAccount |
| **`mysql/`** | MySQL StatefulSet with Secrets and ConfigMaps |
| [mysql/statefulset.yml](kubernetes-in-one-shot/mysql/statefulset.yml) | MySQL StatefulSet |
| [mysql/service.yml](kubernetes-in-one-shot/mysql/service.yml) | MySQL Service |
| [mysql/namespace.yml](kubernetes-in-one-shot/mysql/namespace.yml) | Namespace |
| [mysql/configMap.yml](kubernetes-in-one-shot/mysql/configMap.yml) | ConfigMap |
| [mysql/secrets.yml](kubernetes-in-one-shot/mysql/secrets.yml) | Kubernetes Secret |
| [mysql/vpa.yml](kubernetes-in-one-shot/mysql/vpa.yml) | Vertical Pod Autoscaler |
| **`pods/`** | Special pod patterns |
| [pods/init-container.yml](kubernetes-in-one-shot/pods/init-container.yml) | Init container pattern |
| [pods/sidecar-container.yml](kubernetes-in-one-shot/pods/sidecar-container.yml) | Sidecar container pattern |
| **`crd/`** | Custom Resource Definitions |
| [crd/devops-crd.yml](kubernetes-in-one-shot/crd/devops-crd.yml) | Custom Resource Definition |
| [crd/devops-cr.yml](kubernetes-in-one-shot/crd/devops-cr.yml) | Custom Resource instance |
| [crd/devops-cr2.yml](kubernetes-in-one-shot/crd/devops-cr2.yml) | Second CR instance |
| **`dashboard/`** | |
| [dashboard/dashboard-admin-user.yml](kubernetes-in-one-shot/dashboard/dashboard-admin-user.yml) | K8s Dashboard admin user |
| **`helm/`** | Helm chart packages |
| [helm/get_helm.sh](kubernetes-in-one-shot/helm/get_helm.sh) | Helm installation script |
| [helm/apache-helm-0.1.0.tgz](kubernetes-in-one-shot/helm/apache-helm-0.1.0.tgz) | Packaged Apache Helm chart |
| [helm/node-js-app-0.1.0.tgz](kubernetes-in-one-shot/helm/node-js-app-0.1.0.tgz) | Packaged Node.js Helm chart |
| **`monitoring/`** | |
| [monitoring/get_helm.sh](kubernetes-in-one-shot/monitoring/get_helm.sh) | Install Prometheus + Grafana stack |
| **`django-notes-app/`** | Full Django app with Docker + Jenkins + K8s |
| [django-notes-app/Dockerfile](kubernetes-in-one-shot/django-notes-app/Dockerfile) | Django app Dockerfile |
| [django-notes-app/Jenkinsfile](kubernetes-in-one-shot/django-notes-app/Jenkinsfile) | Jenkins CI pipeline |
| [django-notes-app/docker-compose.yml](kubernetes-in-one-shot/django-notes-app/docker-compose.yml) | Docker Compose for local dev |
| [django-notes-app/README.md](kubernetes-in-one-shot/django-notes-app/README.md) | Project README |

---

## 🔄 CI/CD

> **Folder:** [`ci-cd/`](ci-cd/)
>
> Documentation covering the two most popular CI/CD platforms — GitHub Actions and Jenkins — along with general workflow best practices. Includes real pipeline examples, secrets management, and deployment strategies.

### 📂 Contents

| File | Description |
|------|-------------|
| [ci-cd/github-actions.md](ci-cd/github-actions.md) | Workflow syntax, triggers, jobs, secrets, example workflows |
| [ci-cd/jenkins.md](ci-cd/jenkins.md) | Jenkinsfile syntax, declarative pipelines, plugins, security |
| [ci-cd/workflows.md](ci-cd/workflows.md) | Development pipeline patterns, testing strategy, release management |

---

## 🔁 ArgoCD Demos

> **Folder:** [`argocd-demos/`](argocd-demos/)
>
> Practical demonstrations of ArgoCD GitOps patterns used in production environments. Covers multiple deployment approaches — from CLI to declarative to advanced patterns like App of Apps, ApplicationSets, Image Updater, and multi-cluster deployments.

### 📂 Contents

| File / Folder | Description |
|---------------|-------------|
| [README.md](argocd-demos/README.md) | Setup guide: install kind, kubectl, ArgoCD CLI, access UI |
| **`cli_approach/`** | Deploy apps using the ArgoCD CLI |
| [cli_approach/apache/apache_deployment.yml](argocd-demos/cli_approach/apache/apache_deployment.yml) | Apache Deployment via CLI |
| [cli_approach/apache/apache_svc.yml](argocd-demos/cli_approach/apache/apache_svc.yml) | Apache Service |
| **`declarative_approach/`** | Deploy apps using ArgoCD Application CRDs |
| [declarative_approach/online_shop/online_shop_app.yml](argocd-demos/declarative_approach/online_shop/online_shop_app.yml) | ArgoCD Application manifest |
| [declarative_approach/online_shop/online_shop_deployment.yml](argocd-demos/declarative_approach/online_shop/online_shop_deployment.yml) | Online shop Deployment |
| [declarative_approach/online_shop/online_shop_svc.yml](argocd-demos/declarative_approach/online_shop/online_shop_svc.yml) | Online shop Service |
| **`app_of_apps/`** | App of Apps pattern — manage multiple apps with one root app |
| [app_of_apps/apps/apache_app.yml](argocd-demos/app_of_apps/apps/apache_app.yml) | Apache child app |
| [app_of_apps/apps/nginx_app.yml](argocd-demos/app_of_apps/apps/nginx_app.yml) | Nginx child app |
| [app_of_apps/apps/online_shop_app.yml](argocd-demos/app_of_apps/apps/online_shop_app.yml) | Online shop child app |
| **`applicationsets/`** | ApplicationSets — dynamically generate ArgoCD apps |
| [applicationsets/chai-app/deployment.yml](argocd-demos/applicationsets/chai-app/deployment.yml) | Chai app Deployment |
| [applicationsets/chai-app/service.yml](argocd-demos/applicationsets/chai-app/service.yml) | Chai app Service |
| [applicationsets/chai-app/secret.yml](argocd-demos/applicationsets/chai-app/secret.yml) | Chai app Secret |
| **`git_generator/`** | Generate apps from Git directory structure |
| [git_generator/apache/](argocd-demos/git_generator/apache/apache_deployment.yml) | Apache manifests for Git generator |
| [git_generator/chai-app/](argocd-demos/git_generator/chai-app/deployment.yml) | Chai app manifests |
| [git_generator/online-shop/](argocd-demos/git_generator/online-shop/deployment.yml) | Online shop manifests |
| **`image_updater/`** | Automatically update image tags in Git using ArgoCD Image Updater |
| [image_updater/chai-app/deployment.yml](argocd-demos/image_updater/chai-app/deployment.yml) | Deployment with image updater annotations |
| [image_updater/chai-app/kustomization.yml](argocd-demos/image_updater/chai-app/kustomization.yml) | Kustomize config for image updates |
| **`multicluster/`** | Deploy to multiple Kubernetes clusters |
| [multicluster/online-shop/deployment.yml](argocd-demos/multicluster/online-shop/deployment.yml) | Multi-cluster deployment |
| **`monitoring/`** | Observability apps managed by ArgoCD |
| [monitoring/chai-app/](argocd-demos/monitoring/chai-app/deployment.yml) | Monitoring app manifests |
| [monitoring/online_shop/](argocd-demos/monitoring/online_shop/online_shop_deployment.yml) | Online shop monitoring config |
| **`ui_approach/`** | Deploy apps from the ArgoCD Web UI |
| [ui_approach/nginx/nginx_deployment.yml](argocd-demos/ui_approach/nginx/nginx_deployment.yml) | Nginx Deployment via UI |
| [ui_approach/nginx/nginx_svc.yml](argocd-demos/ui_approach/nginx/nginx_svc.yml) | Nginx Service |

---

## 🔁 ArgoCD Practice

> **Folder:** [`argocd-practice/`](argocd-practice/)
>
> Hands-on YAML manifests for practicing ArgoCD deployments, including a real-world Slotify application with a database backend, ingress, and secrets.

### 📂 Contents

| File / Folder | Description |
|---------------|-------------|
| [argocd-practice/deployment.yaml](argocd-practice/deployment.yaml) | Sample Deployment for practice |
| [argocd-practice/service.yaml](argocd-practice/service.yaml) | Sample Service |
| [argocd-practice/online-shop.yaml](argocd-practice/online-shop.yaml) | Online shop ArgoCD Application CRD |
| **`slotify-app/`** | Full app stack: backend + Postgres DB |
| [slotify-app/deployment.yaml](argocd-practice/slotify-app/deployment.yaml) | Slotify app Deployment |
| [slotify-app/Service.yaml](argocd-practice/slotify-app/Service.yaml) | Slotify Service |
| [slotify-app/ingress.yaml](argocd-practice/slotify-app/ingress.yaml) | Ingress resource |
| [slotify-app/postgres-deployment.yaml](argocd-practice/slotify-app/postgres-deployment.yaml) | PostgreSQL Deployment |
| [slotify-app/postgres-service.yaml](argocd-practice/slotify-app/postgres-service.yaml) | PostgreSQL Service |
| [slotify-app/ConfigMapsecrets.yaml](argocd-practice/slotify-app/ConfigMapsecrets.yaml) | ConfigMap and secrets config |
| [slotify-app/secrets.yaml](argocd-practice/slotify-app/secrets.yaml) | Kubernetes Secrets |

---

## 🏗️ Terraform for DevOps

> **Folder:** [`terraform-for-devops/`](terraform-for-devops/)
>
> A hands-on Terraform repository covering everything from basic AWS resource provisioning to advanced features (modules, EKS clusters, lifecycle rules, import blocks, test framework). Perfect for DevOps engineers learning Infrastructure as Code on AWS.

### 📂 Contents

| File / Folder | Description |
|---------------|-------------|
| [README.md](terraform-for-devops/README.md) | Full guide: commands, structure, learning map |
| [terraform.tf](terraform-for-devops/terraform.tf) | Provider config and version constraints |
| [variables.tf](terraform-for-devops/variables.tf) | Input variables with validation |
| [ec2.tf](terraform-for-devops/ec2.tf) | EC2 instance, security group, key pair |
| [s3.tf](terraform-for-devops/s3.tf) | S3 bucket with versioning and encryption |
| [dynamodb.tf](terraform-for-devops/dynamodb.tf) | DynamoDB table |
| [outputs.tf](terraform-for-devops/outputs.tf) | Output values |
| [script.sh](terraform-for-devops/script.sh) | EC2 user_data bootstrap script |
| **`eks/`** | EKS cluster using Terraform EKS module v21.x |
| [eks/eks.tf](terraform-for-devops/eks/eks.tf) | EKS cluster with managed node groups |
| [eks/vpc.tf](terraform-for-devops/eks/vpc.tf) | VPC module for EKS networking |
| [eks/provider.tf](terraform-for-devops/eks/provider.tf) | Provider and locals |
| [eks/outputs.tf](terraform-for-devops/eks/outputs.tf) | EKS outputs |
| [eks/README.md](terraform-for-devops/eks/README.md) | EKS module guide |
| **`aws_module_project/`** | Reusable Terraform modules (dev/stg/prd) |
| [aws_module_project/main.tf](terraform-for-devops/aws_module_project/main.tf) | Module composition for multiple envs |
| [aws_module_project/providers.tf](terraform-for-devops/aws_module_project/providers.tf) | AWS provider |
| [aws_module_project/terraform.tf](terraform-for-devops/aws_module_project/terraform.tf) | Version constraints |
| **`examples/`** | Modern Terraform features (1.5+) |
| [examples/for_each.tf](terraform-for-devops/examples/for_each.tf) | `for_each` and dynamic blocks |
| [examples/validation.tf](terraform-for-devops/examples/validation.tf) | Variable validation blocks |
| [examples/lifecycle.tf](terraform-for-devops/examples/lifecycle.tf) | `lifecycle` meta-arguments |
| [examples/moved.tf](terraform-for-devops/examples/moved.tf) | `moved` blocks for safe refactoring |
| [examples/import.tf](terraform-for-devops/examples/import.tf) | `import` blocks (Terraform 1.5+) |
| [examples/check.tf](terraform-for-devops/examples/check.tf) | `check` blocks for continuous assertions |
| [examples/removed.tf](terraform-for-devops/examples/removed.tf) | `removed` blocks for safe deletion |
| [examples/README.md](terraform-for-devops/examples/README.md) | Examples guide |

---

## 🌐 Nginx

> **Folder:** [`nginx/`](nginx/)
>
> Documentation for configuring Nginx as a web server and reverse proxy. Covers SSL termination, load balancing, caching, security headers, and WebSocket proxying.

### 📂 Contents

| File | Description |
|------|-------------|
| [nginx/basic-config.md](nginx/basic-config.md) | Server blocks, location blocks, SSL, performance, security headers, logging |
| [nginx/reverse-proxy.md](nginx/reverse-proxy.md) | Reverse proxy setup, load balancing, SSL termination, caching, WebSocket |

---

## 🐧 Linux

> **Folder:** [`linux/`](linux/)
>
> Essential Linux knowledge for DevOps engineers. Covers day-to-day Bash commands, file permission management, and network troubleshooting — all from a practical DevOps perspective.

### 📂 Contents

| File | Description |
|------|-------------|
| [linux/bash-commands.md](linux/bash-commands.md) | System monitoring, file management, networking, package management, users, services |
| [linux/file-permissions.md](linux/file-permissions.md) | Permission types, ownership, special permissions, ACLs, security best practices |
| [linux/networking-basics.md](linux/networking-basics.md) | Interface config, routing, firewall rules, DNS, troubleshooting |

---

## 📁 Git

> **Folder:** [`git/`](git/)
>
> A concise Git CLI reference covering the commands and workflows every DevOps engineer uses daily — from basic operations to advanced branching, rebase, and automation-friendly patterns.

### 📂 Contents

| File | Description |
|------|-------------|
| [git/git-cli.md](git/git-cli.md) | Basic commands, branching strategy, merge vs rebase, advanced operations, best practices |

---

## 🛒 Retail Store Sample App

> **Folder:** [`retail-store-sample-app/`](retail-store-sample-app/)
>
> A production-grade GitOps project demonstrating how to deploy a full microservices retail application on **AWS EKS Auto Mode** using Terraform, ArgoCD, GitHub Actions and Helm. Features dual-branch strategy (public vs production/GitOps branch) and includes complete Terraform IaC.
>
> **Tech Stack:** AWS EKS Auto Mode · ArgoCD · Terraform · GitHub Actions · NGINX Ingress · Cert-Manager · Helm

### 📂 Contents

| File / Folder | Description |
|---------------|-------------|
| [README.md](retail-store-sample-app/README.md) | Full deployment guide: prerequisites, Terraform, ArgoCD, GitOps |
| [BRANCHING_STRATEGY.md](retail-store-sample-app/BRANCHING_STRATEGY.md) | Dual-branch (public vs GitOps) strategy explained |
| **`terraform/`** | Full IaC for EKS + ArgoCD + VPC |
| [terraform/main.tf](retail-store-sample-app/terraform/main.tf) | Core infrastructure: VPC, EKS, node groups |
| [terraform/argocd.tf](retail-store-sample-app/terraform/argocd.tf) | ArgoCD installation via Terraform |
| [terraform/addons.tf](retail-store-sample-app/terraform/addons.tf) | EKS add-ons: NGINX Ingress, Cert-Manager |
| [terraform/variables.tf](retail-store-sample-app/terraform/variables.tf) | Configurable input variables |
| [terraform/outputs.tf](retail-store-sample-app/terraform/outputs.tf) | Terraform outputs |
| [terraform/security.tf](retail-store-sample-app/terraform/security.tf) | Security groups and IAM roles |
| [terraform/locals.tf](retail-store-sample-app/terraform/locals.tf) | Local values |
| [terraform/versions.tf](retail-store-sample-app/terraform/versions.tf) | Provider version constraints |
| [terraform/README.md](retail-store-sample-app/terraform/README.md) | Terraform module documentation |

---

## 🌍 Wanderlust Mega Project

> **Folder:** [`Wanderlust-Mega-Project/`](Wanderlust-Mega-Project/)
>
> An end-to-end **DevSecOps + GitOps** project deploying a full MERN stack travel blog application on AWS EKS. Integrates Jenkins CI, SonarQube, OWASP dependency check, Trivy, ArgoCD CD, Redis caching, and Prometheus + Grafana monitoring.
>
> **Tech Stack:** GitHub · Docker · Jenkins · SonarQube · OWASP · Trivy · ArgoCD · Redis · AWS EKS · Helm · Prometheus · Grafana

### 📂 Contents

| File / Folder | Description |
|---------------|-------------|
| [README.md](Wanderlust-Mega-Project/README.md) | Complete project setup: Jenkins, EKS, ArgoCD, monitoring |
| [Jenkinsfile](Wanderlust-Mega-Project/Jenkinsfile) | Main CI pipeline (build, scan, push) |
| [docker-compose.yml](Wanderlust-Mega-Project/docker-compose.yml) | Local dev stack: frontend + backend + Redis + MongoDB |
| [package.json](Wanderlust-Mega-Project/package.json) | Root package config |
| **`backend/`** | Node.js Express API |
| [backend/server.js](Wanderlust-Mega-Project/backend/server.js) | Express server entry point |
| [backend/Dockerfile](Wanderlust-Mega-Project/backend/Dockerfile) | Backend Docker image |
| [backend/.env.sample](Wanderlust-Mega-Project/backend/.env.sample) | Environment variable template |
| **`frontend/`** | React + Vite + Tailwind UI |
| [frontend/Dockerfile](Wanderlust-Mega-Project/frontend/Dockerfile) | Frontend Docker image |
| [frontend/vite.config.ts](Wanderlust-Mega-Project/frontend/vite.config.ts) | Vite build config |
| **`database/`** | |
| [database/Dockerfile](Wanderlust-Mega-Project/database/Dockerfile) | MongoDB Docker image |
| **`kubernetes/`** | Kubernetes manifests for EKS deployment |
| [kubernetes/backend.yaml](Wanderlust-Mega-Project/kubernetes/backend.yaml) | Backend Deployment + Service |
| [kubernetes/frontend.yaml](Wanderlust-Mega-Project/kubernetes/frontend.yaml) | Frontend Deployment + Service |
| [kubernetes/mongodb.yaml](Wanderlust-Mega-Project/kubernetes/mongodb.yaml) | MongoDB StatefulSet + Service |
| [kubernetes/redis.yaml](Wanderlust-Mega-Project/kubernetes/redis.yaml) | Redis Deployment |
| [kubernetes/persistentVolume.yaml](Wanderlust-Mega-Project/kubernetes/persistentVolume.yaml) | PersistentVolume for MongoDB |
| [kubernetes/persistentVolumeClaim.yaml](Wanderlust-Mega-Project/kubernetes/persistentVolumeClaim.yaml) | PVC for MongoDB |
| [kubernetes/README.md](Wanderlust-Mega-Project/kubernetes/README.md) | Kubernetes deployment guide |
| [kubernetes/kubeadm.md](Wanderlust-Mega-Project/kubernetes/kubeadm.md) | Kubeadm cluster setup notes |
| **`GitOps/`** | |
| [GitOps/Jenkinsfile](Wanderlust-Mega-Project/GitOps/Jenkinsfile) | GitOps CD pipeline (update image tags in Git) |
| **`Automations/`** | |
| [Automations/updatebackendnew.sh](Wanderlust-Mega-Project/Automations/updatebackendnew.sh) | Script to update backend image tag |
| [Automations/updatefrontendnew.sh](Wanderlust-Mega-Project/Automations/updatefrontendnew.sh) | Script to update frontend image tag |
| [Assets/README.md](Wanderlust-Mega-Project/Assets/README.md) | Project assets and diagrams |

---

## 📚 Learning Resources

A curated list of high-quality free resources for each topic in this repository.

### 🐚 Shell Scripting
- 📖 [Bash Scripting Cheatsheet](https://devhints.io/bash) — Quick reference for syntax, loops, and conditionals
- 📖 [The Linux Command Line (free PDF)](https://www.linuxcommand.org/tlcl.php) — Full book on Bash and the command line
- 🎥 [Shell Scripting Tutorial for Beginners – freeCodeCamp](https://www.youtube.com/watch?v=v-F3YLd6oMw) — 5-hour hands-on course
- 📖 [ShellCheck](https://www.shellcheck.net/) — Linter for finding bugs in shell scripts

### 🐋 Docker
- 📖 [Official Docker Docs](https://docs.docker.com/) — Official reference and guides
- 🎥 [Docker Tutorial for Beginners – TechWorld with Nana](https://www.youtube.com/watch?v=3c-iBn73dDE) — Full crash course
- 📖 [Docker Best Practices (docs.docker.com)](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/) — Official Dockerfile best practices
- 🎮 [Play with Docker](https://labs.play-with-docker.com/) — Free browser-based Docker playground

### ☸️ Kubernetes
- 📖 [Official Kubernetes Docs](https://kubernetes.io/docs/home/) — Reference docs and tutorials
- 🎥 [Kubernetes Tutorial for Beginners – TechWorld with Nana](https://www.youtube.com/watch?v=X48VuDVv0do) — Most popular K8s intro (4 hours)
- 📖 [Kubernetes the Hard Way (Kelsey Hightower)](https://github.com/kelseyhightower/kubernetes-the-hard-way) — Deep-dive bootstrap guide
- 🎮 [Killercoda Kubernetes Scenarios](https://killercoda.com/playgrounds/scenario/kubernetes) — Free interactive K8s practice
- 📖 [kubestarter](https://github.com/LondheShubham153/kubestarter) — Starter templates referenced in this repo

### 🔄 CI/CD
- 📖 [GitHub Actions Docs](https://docs.github.com/en/actions) — Official workflow reference
- 🎥 [GitHub Actions CI/CD – TechWorld with Nana](https://www.youtube.com/watch?v=R8_veQiYBjI) — Complete GitHub Actions tutorial
- 📖 [Jenkins Docs](https://www.jenkins.io/doc/) — Official Jenkins pipeline reference
- 🎥 [Jenkins Full Course – Edureka](https://www.youtube.com/watch?v=FX322RVNGj4) — Jenkins beginner to advanced

### 🔁 ArgoCD / GitOps
- 📖 [ArgoCD Official Docs](https://argo-cd.readthedocs.io/en/stable/) — Concepts, API reference, RBAC
- 🎥 [ArgoCD Tutorial – TechWorld with Nana](https://www.youtube.com/watch?v=MeU5_k9ssrs) — Best GitOps intro video
- 📖 [GitOps Principles (OpenGitOps)](https://opengitops.dev/) — GitOps core principles
- 📖 [ArgoCD ApplicationSets Docs](https://argo-cd.readthedocs.io/en/stable/user-guide/application-set/) — Advanced app generation

### 🏗️ Terraform
- 📖 [Terraform Official Docs](https://developer.hashicorp.com/terraform/docs) — HCL reference and guides
- 🎥 [Terraform Full Course – freeCodeCamp](https://www.youtube.com/watch?v=SLB_c_ayRMo) — 2-hour beginner course
- 📖 [Terraform Best Practices](https://www.terraform-best-practices.com/) — Community best practice guide
- 🎮 [Terraform playground on KillerCoda](https://killercoda.com/terraform) — Browser-based Terraform practice

### 🌐 Nginx
- 📖 [Nginx Official Docs](https://nginx.org/en/docs/) — Full directive and module reference
- 📖 [Nginx Beginner's Guide](https://nginx.org/en/docs/beginners_guide.html) — Official getting started guide
- 🎥 [Nginx Crash Course – Traversy Media](https://www.youtube.com/watch?v=hcw-NjOh8r0) — Quick setup and config tutorial

### 🐧 Linux
- 📖 [Linux Journey](https://linuxjourney.com/) — Interactive, free Linux learning platform
- 📖 [OverTheWire: Bandit](https://overthewire.org/wargames/bandit/) — Gamified Linux command practice
- 🎥 [Linux for Beginners – freeCodeCamp](https://www.youtube.com/watch?v=sWbUDq4S6Y8) — Full Linux tutorial
- 📖 [TLDR Pages](https://tldr.sh/) — Simplified man pages for common commands

### 📁 Git
- 📖 [Pro Git Book (free)](https://git-scm.com/book/en/v2) — The definitive Git reference
- 🎮 [Learn Git Branching](https://learngitbranching.js.org/) — Interactive visual Git tutorial
- 📖 [GitHub Flow Guide](https://guides.github.com/introduction/flow/) — Simple branching workflow
- 🎥 [Git & GitHub Crash Course – Traversy Media](https://www.youtube.com/watch?v=SWYqp7iY_Tc) — Practical Git tutorial

### ☁️ AWS (General)
- 📖 [AWS Documentation](https://docs.aws.amazon.com/) — Official service docs
- 🎥 [AWS Certified Cloud Practitioner – freeCodeCamp](https://www.youtube.com/watch?v=SOTamWNgDKc) — 14-hour full course
- 🎮 [AWS Free Tier](https://aws.amazon.com/free/) — Practice on real AWS services for free

### 🎯 DevOps Roadmap
- 📖 [roadmap.sh/devops](https://roadmap.sh/devops) — The most popular DevOps learning roadmap
- 📖 [90DaysOfDevOps](https://github.com/MichaelCade/90DaysOfDevOps) — Structured 90-day DevOps learning plan

---

## 🗺️ How to Navigate This Repository

```
devops-learning/
├── Shell-Scripting-For-DevOps/   # Start here for scripting basics
├── linux/                        # Linux fundamentals
├── git/                          # Git CLI guide
├── docker/                       # Containerization docs
├── k8s/                          # Kubernetes docs + manifests
├── kubernetes-in-one-shot/       # Full K8s hands-on reference
├── ci-cd/                        # GitHub Actions + Jenkins
├── argocd-demos/                 # GitOps patterns (ArgoCD)
├── argocd-practice/              # ArgoCD YAML practice
├── terraform-for-devops/         # Infrastructure as Code
├── nginx/                        # Web server + reverse proxy
├── retail-store-sample-app/      # Real-world EKS GitOps project
└── Wanderlust-Mega-Project/      # End-to-end DevSecOps project
```

### 🧭 Suggested Learning Path

1. **Foundations** → `linux/` → `git/` → `Shell-Scripting-For-DevOps/`
2. **Containers** → `docker/`
3. **Orchestration** → `k8s/` → `kubernetes-in-one-shot/`
4. **CI/CD** → `ci-cd/`
5. **GitOps** → `argocd-demos/` → `argocd-practice/`
6. **IaC** → `terraform-for-devops/`
7. **Web Server** → `nginx/`
8. **Real Projects** → `retail-store-sample-app/` → `Wanderlust-Mega-Project/`

---

## 🤝 Contributing

Contributions are always welcome! Here's how you can help:

1. **Report Issues** — Open a GitHub issue for bugs, outdated content, or suggestions
2. **Improve Docs** — Submit a PR to fix typos, add examples, or improve explanations
3. **Add Scripts** — Add new shell scripts, manifests, or Terraform configs
4. **Add Resources** — Know a great tutorial or guide? Add it to the Resources section

Please ensure your contributions follow the existing folder structure and naming conventions.

---

## 📄 License

This repository is available under the **MIT License**. See the [LICENSE](LICENSE) file for details.

---

<div align="center">

⭐ **If this repo helped you, please give it a star!** ⭐

</div>

