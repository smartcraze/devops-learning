# EKS Cluster — Module v21.x with Kubernetes 1.35
# Uses EKS Pod Identity (replaces IRSA), access_entries (replaces aws-auth),
# AL2023 AMI (default), and AWS provider v6.0+

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  # Cluster configuration
  name                    = local.name
  kubernetes_version      = "1.35"
  endpoint_public_access  = true
  endpoint_private_access = true

  # Grant the cluster creator admin permissions via access_entries
  enable_cluster_creator_admin_permissions = true

  # EKS Add-ons (latest versions auto-resolved)
  addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent    = true
      before_compute = true # Deploy before node groups to avoid networking issues
    }
    eks-pod-identity-agent = {
      most_recent    = true
      before_compute = true # Enables pod-level IAM via Pod Identity
    }
  }

  # Networking
  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.intra_subnets

  # Managed Node Groups
  eks_managed_node_groups = {
    bankapp-ng = {
      min_size     = 2
      max_size     = 3
      desired_size = 2

      instance_types = ["t2.medium"]
      capacity_type  = "SPOT"

      tags = {
        ExtraTag = "MyCluster"
      }
    }
  }

  tags = local.tags
}
