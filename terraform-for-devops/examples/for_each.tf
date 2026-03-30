# ============================================================
# for_each — Create multiple resources from a map or set
# ============================================================
# Use for_each when each resource needs a unique identity (key).
# Use count when you just need N identical copies.
#
# for_each advantages over count:
#   - Removing an item from the middle doesn't shift all indexes
#   - Each resource is identified by key, not index number
#   - Easier to manage in state (e.g., aws_s3_bucket.app["logs"])

# --- Example 1: Create multiple S3 buckets from a map ---

variable "buckets" {
  description = "Map of bucket names to their configurations"
  type = map(object({
    versioning = bool
  }))
  default = {
    "logs"    = { versioning = true }
    "uploads" = { versioning = false }
    "backups" = { versioning = true }
  }
}

resource "aws_s3_bucket" "app" {
  for_each = var.buckets

  bucket = "myapp-${each.key}-bucket"

  tags = {
    Name = each.key
  }
}

resource "aws_s3_bucket_versioning" "app" {
  for_each = { for k, v in var.buckets : k => v if v.versioning }

  bucket = aws_s3_bucket.app[each.key].id

  versioning_configuration {
    status = "Enabled"
  }
}

# --- Example 2: Dynamic blocks with for_each ---
# Dynamic blocks let you generate repeated nested blocks inside a resource.

variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    port        = number
    description = string
  }))
  default = [
    { port = 22, description = "SSH" },
    { port = 80, description = "HTTP" },
    { port = 443, description = "HTTPS" },
  ]
}

resource "aws_security_group" "dynamic_example" {
  name        = "dynamic-sg"
  description = "Security group using dynamic blocks"

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = ingress.value.description
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# --- Example 3: for_each with toset() for simple lists ---

resource "aws_iam_user" "team" {
  for_each = toset(["alice", "bob", "carol"])

  name = each.key
}
