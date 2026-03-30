variable "aws_region" {
  description = "AWS region where resources will be provisioned"
  type        = string
  default     = "us-east-2"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-085f9c64a9b75eed5"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"

  validation {
    condition     = contains(["t2.micro", "t2.small", "t2.medium", "t3.micro", "t3.small", "t3.medium"], var.instance_type)
    error_message = "Instance type must be one of: t2.micro, t2.small, t2.medium, t3.micro, t3.small, t3.medium."
  }
}

variable "my_environment" {
  description = "Deployment environment (dev, staging, prd)"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prd"], var.my_environment)
    error_message = "Environment must be one of: dev, staging, prd."
  }
}
