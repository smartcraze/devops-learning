# ============================================================
# Terraform Test Framework (Terraform 1.6+)
# ============================================================
# Run with: terraform test
#
# Each "run" block is a test case. Tests execute in order.
# command = plan  → only runs terraform plan (no real resources)
# command = apply → actually creates resources (cleaned up after)

provider "aws" {
  region = "us-east-2"
}

# --- Test 1: Verify bucket naming convention (plan only) ---
run "bucket_name_format" {
  command = plan

  variables {
    environment   = "dev"
    bucket_prefix = "myapp"
  }

  assert {
    condition     = aws_s3_bucket.this.bucket == "myapp-dev-data"
    error_message = "Bucket name should follow the pattern: prefix-environment-data"
  }
}

# --- Test 2: Verify tags are set correctly ---
run "bucket_tags" {
  command = plan

  variables {
    environment   = "staging"
    bucket_prefix = "myapp"
  }

  assert {
    condition     = aws_s3_bucket.this.tags["Environment"] == "staging"
    error_message = "Environment tag should match the environment variable"
  }

  assert {
    condition     = aws_s3_bucket.this.tags["ManagedBy"] == "terraform"
    error_message = "ManagedBy tag should be 'terraform'"
  }
}

# --- Test 3: Verify versioning is enabled ---
run "versioning_enabled" {
  command = plan

  variables {
    environment   = "prod"
    bucket_prefix = "myapp"
  }

  assert {
    condition     = aws_s3_bucket_versioning.this.versioning_configuration[0].status == "Enabled"
    error_message = "Bucket versioning must be enabled"
  }
}
