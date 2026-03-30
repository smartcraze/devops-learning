# ============================================================
# Lifecycle Meta-Argument — Control resource behavior
# ============================================================
# Every resource supports a lifecycle block that changes how
# Terraform creates, updates, and destroys it.

# --- Example 1: prevent_destroy ---
# Terraform will refuse to destroy this resource (even with terraform destroy).
# You must remove the lifecycle block first to destroy it.
# Great for databases, S3 buckets with important data, etc.

# resource "aws_db_instance" "production" {
#   identifier     = "prod-db"
#   engine         = "postgres"
#   instance_class = "db.t3.micro"
#
#   lifecycle {
#     prevent_destroy = true
#   }
# }

# --- Example 2: ignore_changes ---
# Terraform ignores changes to specified attributes.
# Useful when something external (autoscaler, CI/CD) modifies the resource.

# resource "aws_instance" "app" {
#   ami           = "ami-0c55b159cbfafe1f0"
#   instance_type = "t2.micro"
#
#   tags = {
#     Name = "app-server"
#   }
#
#   lifecycle {
#     # Ignore tag changes made by AWS or other tools
#     ignore_changes = [tags]
#   }
# }

# --- Example 3: create_before_destroy ---
# Create the replacement resource BEFORE destroying the old one.
# Prevents downtime during resource replacement.

# resource "aws_instance" "web" {
#   ami           = "ami-0c55b159cbfafe1f0"
#   instance_type = "t2.micro"
#
#   lifecycle {
#     create_before_destroy = true
#   }
# }

# --- Example 4: replace_triggered_by ---
# Force replacement when another resource changes.

# resource "aws_instance" "app" {
#   ami           = "ami-0c55b159cbfafe1f0"
#   instance_type = "t2.micro"
#
#   lifecycle {
#     # Recreate this instance whenever the security group changes
#     replace_triggered_by = [aws_security_group.app.id]
#   }
# }

# --- Common patterns ---
# Database:    prevent_destroy = true
# ASG targets: ignore_changes = [desired_capacity]
# Zero-downtime: create_before_destroy = true
# Config reload: replace_triggered_by = [resource.id]
