# ============================================================
# Moved Blocks (Terraform 1.1+)
# ============================================================
# Refactor your Terraform code without destroying infrastructure.
# When you rename a resource or move it into a module, Terraform
# would normally destroy the old one and create a new one.
# The moved block tells Terraform "it's the same resource, just renamed."

# --- Example 1: Rename a resource ---
# You had: aws_instance.web_server
# You want: aws_instance.application_server

# moved {
#   from = aws_instance.web_server
#   to   = aws_instance.application_server
# }
#
# resource "aws_instance" "application_server" {
#   ami           = "ami-0c55b159cbfafe1f0"
#   instance_type = "t2.micro"
# }

# --- Example 2: Move a resource into a module ---
# You had: aws_security_group.app (at root level)
# You want: module.networking.aws_security_group.app

# moved {
#   from = aws_security_group.app
#   to   = module.networking.aws_security_group.app
# }
#
# module "networking" {
#   source = "./modules/networking"
# }

# --- Example 3: Refactor count to for_each ---
# You had: aws_instance.servers[0] and aws_instance.servers[1]
# You want: aws_instance.servers["web"] and aws_instance.servers["api"]

# moved {
#   from = aws_instance.servers[0]
#   to   = aws_instance.servers["web"]
# }
#
# moved {
#   from = aws_instance.servers[1]
#   to   = aws_instance.servers["api"]
# }
#
# resource "aws_instance" "servers" {
#   for_each      = toset(["web", "api"])
#   ami           = "ami-0c55b159cbfafe1f0"
#   instance_type = "t2.micro"
#   tags = {
#     Name = each.value
#   }
# }

# --- Example 4: Rename a module ---

# moved {
#   from = module.database
#   to   = module.rds_primary
# }
#
# module "rds_primary" {
#   source = "./modules/rds"
# }

# --- How it works ---
# 1. Rename your resource/module in the .tf file
# 2. Add the moved block
# 3. Run terraform plan — it shows "moved" instead of "destroy + create"
# 4. Run terraform apply — state is updated, no infra changes
# 5. Remove the moved block after apply (optional, but keeps code clean)
