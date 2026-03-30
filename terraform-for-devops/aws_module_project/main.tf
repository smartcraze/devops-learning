# Use a data source instead of hardcoding AMI IDs.
# AMI IDs differ by region and change over time — a data source
# always fetches the latest available image automatically.
data "aws_ami" "ubuntu" {
  owners      = ["099720109477"]
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/*amd64*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

# dev
module "dev-app" {
  source        = "./my_app_infra_module"
  my_env        = "dev"
  instance_type = "t2.micro"
  ami           = data.aws_ami.ubuntu.id
}

# prd
module "prd-app" {
  source        = "./my_app_infra_module"
  my_env        = "prd"
  instance_type = "t2.medium"
  ami           = data.aws_ami.ubuntu.id
}

# stg
module "stg-app" {
  source        = "./my_app_infra_module"
  my_env        = "stg"
  instance_type = "t2.small"
  ami           = data.aws_ami.ubuntu.id
}

output "dev_app_public_ips" {
  value       = module.dev-app.ec2_instances_public_ips
  description = "Public IPs of the dev environment EC2 instances"
}

output "prd_app_public_ips" {
  value       = module.prd-app.ec2_instances_public_ips
  description = "Public IPs of the prd environment EC2 instances"
}

output "stg_app_public_ips" {
  value       = module.stg-app.ec2_instances_public_ips
  description = "Public IPs of the stg environment EC2 instances"
}
