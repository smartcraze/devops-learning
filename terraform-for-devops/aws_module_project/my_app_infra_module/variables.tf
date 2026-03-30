variable "my_env" {
  description = "The environment for the app (dev, stg, prd)"
  type        = string

  validation {
    condition     = contains(["dev", "stg", "prd"], var.my_env)
    error_message = "Environment must be one of: dev, stg, prd."
  }
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string

  validation {
    condition     = can(regex("^t[23]\\.", var.instance_type))
    error_message = "Instance type must be a t2 or t3 family instance."
  }
}

variable "ami" {
  description = "AMI ID for the EC2 instances"
  type        = string

  validation {
    condition     = startswith(var.ami, "ami-")
    error_message = "AMI ID must start with 'ami-'."
  }
}
