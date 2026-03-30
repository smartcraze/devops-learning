# ============================================================
# Variable Validation — Catch bad inputs before plan/apply
# ============================================================
# Validation blocks run during terraform plan, before any
# resources are created. This prevents wasted time and money.

# --- Example 1: Simple allowed values ---

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

# --- Example 2: Multiple validations on one variable ---

variable "database_name" {
  description = "Name for the RDS database"
  type        = string

  validation {
    condition     = length(var.database_name) >= 3
    error_message = "Database name must be at least 3 characters."
  }

  validation {
    condition     = can(regex("^[a-zA-Z][a-zA-Z0-9]*$", var.database_name))
    error_message = "Database name must start with a letter and contain only alphanumeric characters."
  }
}

# --- Example 3: Validate CIDR blocks ---

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"

  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "Must be a valid CIDR block (e.g., 10.0.0.0/16)."
  }
}

# --- Example 4: Validate port range ---

variable "app_port" {
  description = "Application listening port"
  type        = number
  default     = 8080

  validation {
    condition     = var.app_port >= 1024 && var.app_port <= 65535
    error_message = "Port must be between 1024 and 65535 (non-privileged)."
  }
}

# --- Example 5: Cross-variable validation (Terraform 1.9+) ---

variable "enable_backups" {
  description = "Whether to enable automated backups"
  type        = bool
  default     = false

  validation {
    condition     = var.environment != "prod" || var.enable_backups == true
    error_message = "Backups must be enabled in production."
  }
}
