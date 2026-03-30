# EKS Cluster with Terraform

Production-ready Amazon EKS cluster provisioned with Terraform using official AWS modules.

## What Gets Created

```
                        ┌─────────────────────────────────────────────┐
                        │                 VPC (10.0.0.0/16)           │
                        │                                             │
                        │  ┌──────────────┐    ┌──────────────┐      │
                        │  │  Public Sub   │    │  Public Sub   │      │
                        │  │  10.0.1.0/24  │    │  10.0.2.0/24  │      │
                        │  │  (us-east-2a) │    │  (us-east-2b) │      │
                        │  └──────┬───────┘    └──────┬───────┘      │
                        │         │ NAT GW            │ NAT GW       │
                        │  ┌──────┴───────┐    ┌──────┴───────┐      │
                        │  │ Private Sub   │    │ Private Sub   │      │
                        │  │ 10.0.3.0/24   │    │ 10.0.4.0/24   │      │
                        │  │ (Worker Nodes)│    │ (Worker Nodes)│      │
                        │  └──────────────┘    └──────────────┘      │
                        │  ┌──────────────┐    ┌──────────────┐      │
                        │  │  Intra Sub    │    │  Intra Sub    │      │
                        │  │  10.0.5.0/24  │    │  10.0.6.0/24  │      │
                        │  │ (Control Plane)│   │ (Control Plane)│     │
                        │  └──────────────┘    └──────────────┘      │
                        └─────────────────────────────────────────────┘
```

| Resource | Details |
|---|---|
| **VPC** | `10.0.0.0/16` across 2 AZs with public, private, and intra subnets |
| **NAT Gateways** | One per AZ for private subnet internet access |
| **EKS Cluster** | `my-eks-cluster` running Kubernetes **1.35** |
| **Node Group** | `bankapp-ng` — 2-3 `t2.medium` SPOT instances on AL2023 |
| **Add-ons** | CoreDNS, kube-proxy, VPC-CNI, EKS Pod Identity Agent |
| **Security** | KMS encryption, OIDC provider, cluster creator admin access |

## Kubernetes 1.35 Highlights

- **In-Place Pod Resource Updates** — Adjust CPU/memory without restarting pods (GA)
- **Dynamic Resource Allocation** — Efficient GPU/hardware management (stable)
- **Image Volumes** — Deliver AI models via OCI container images
- **StatefulSet MaxUnavailable** — Up to 60% faster stateful app updates

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.5.7
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) v2
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- AWS credentials configured (`aws configure`)

## Quick Start

```bash
# Initialize
terraform init

# Preview changes
terraform plan

# Create the cluster (~15 minutes)
terraform apply
```

## Connect to the Cluster

```bash
# Configure kubectl (also shown in terraform output)
aws eks update-kubeconfig --name my-eks-cluster --region us-east-2

# Verify
kubectl get nodes
kubectl get pods -A
```

## Project Structure

```
.
├── provider.tf    # Terraform & AWS provider config, locals (region, CIDR, AZs)
├── vpc.tf         # VPC module — subnets, NAT gateways, route tables
├── eks.tf         # EKS module — cluster, node groups, add-ons
├── outputs.tf     # Cluster endpoint, VPC IDs, kubectl command
└── .gitignore     # Excludes state files and .terraform/
```

## EKS Add-ons

| Add-on | Purpose |
|---|---|
| **CoreDNS** | Cluster DNS resolution |
| **kube-proxy** | Network rules for pod-to-pod communication |
| **VPC-CNI** | Native VPC networking — assigns ENI IPs to pods |
| **EKS Pod Identity Agent** | Pod-level IAM roles (replaces IRSA) |

## Architecture Decisions

- **Pod Identity over IRSA** — Simpler setup, no OIDC trust policy management, built-in session tagging
- **SPOT instances** — Cost-effective for non-critical workloads; switch to `ON_DEMAND` for production
- **AL2023 AMI** — Default in EKS module v21.x; uses containerd, IMDSv2, SELinux
- **Intra subnets** — Isolated subnets for EKS control plane ENIs (no internet route)
- **NAT per AZ** — High availability for outbound traffic from private subnets

## Cost Considerations

| Resource | Estimated Cost |
|---|---|
| EKS Cluster | ~$0.10/hr ($73/mo) |
| NAT Gateways (x2) | ~$0.045/hr each ($65/mo total) |
| t2.medium SPOT (x2) | ~$0.012/hr each ($17/mo total) |
| **Total estimate** | **~$155/mo** |

Costs vary by region and SPOT pricing. Destroy when not in use to avoid charges.

## Cleanup

```bash
# Destroy all resources
terraform destroy
```

## Module Versions

| Module | Version | Registry |
|---|---|---|
| terraform-aws-modules/eks/aws | ~> 21.0 | [Terraform Registry](https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest) |
| terraform-aws-modules/vpc/aws | ~> 6.0 | [Terraform Registry](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest) |
| hashicorp/aws provider | ~> 6.0 | [Terraform Registry](https://registry.terraform.io/providers/hashicorp/aws/latest) |
