# ============================================================
# Import Blocks (Terraform 1.5+)
# ============================================================
# Import existing cloud resources into Terraform management
# without destroying and recreating them.
#
# Before 1.5, you had to use: terraform import aws_s3_bucket.example my-bucket
# Now you can do it declaratively in code!
#
# Workflow:
#   1. Write the import block and the matching resource block
#   2. Run: terraform plan  (shows what will be imported)
#   3. Run: terraform apply (imports into state)
#   4. Remove the import block (it's a one-time operation)

# --- Example 1: Import an existing S3 bucket ---

# import {
#   to = aws_s3_bucket.existing_bucket
#   id = "my-existing-bucket-name"   # The actual bucket name in AWS
# }
#
# resource "aws_s3_bucket" "existing_bucket" {
#   bucket = "my-existing-bucket-name"
# }

# --- Example 2: Import an existing EC2 instance ---

# import {
#   to = aws_instance.existing_server
#   id = "i-0123456789abcdef0"       # The actual instance ID from AWS
# }
#
# resource "aws_instance" "existing_server" {
#   ami           = "ami-0c55b159cbfafe1f0"
#   instance_type = "t2.micro"
#
#   tags = {
#     Name = "my-existing-server"
#   }
# }

# --- Example 3: Import with for_each (bulk import) ---

# import {
#   for_each = {
#     "web-sg" = "sg-0123456789abcdef0"
#     "db-sg"  = "sg-fedcba9876543210f"
#   }
#   to = aws_security_group.imported[each.key]
#   id = each.value
# }
#
# resource "aws_security_group" "imported" {
#   for_each = toset(["web-sg", "db-sg"])
#   name     = each.key
# }

# --- Pro Tips ---
# - Use `terraform plan -generate-config-out=generated.tf` to auto-generate
#   the resource block configuration from the imported resource.
# - The import block is removed after successful import.
# - Import does NOT modify the actual cloud resource.
