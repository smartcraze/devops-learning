# ============================================================
# Check Blocks (Terraform 1.5+)
# ============================================================
# Continuous infrastructure assertions that run after every
# plan/apply. Unlike validation blocks (which block execution),
# check blocks only produce WARNINGS — they never fail the plan.
#
# Use cases:
#   - Verify deployed infrastructure is healthy
#   - Check that security policies are followed
#   - Monitor configuration drift

# --- Example 1: Verify S3 bucket has versioning ---

# check "s3_versioning_enabled" {
#   data "aws_s3_bucket" "app" {
#     bucket = "my-app-bucket"
#   }
#
#   assert {
#     condition     = data.aws_s3_bucket.app.versioning[0].enabled == true
#     error_message = "WARNING: S3 bucket versioning is not enabled!"
#   }
# }

# --- Example 2: Verify EC2 instance is running ---

# check "instance_running" {
#   data "aws_instance" "web" {
#     instance_id = "i-0123456789abcdef0"
#   }
#
#   assert {
#     condition     = data.aws_instance.web.instance_state == "running"
#     error_message = "WARNING: EC2 instance is not in running state!"
#   }
# }

# --- Example 3: HTTP health check ---

# check "app_health" {
#   data "http" "health" {
#     url = "https://myapp.example.com/health"
#   }
#
#   assert {
#     condition     = data.http.health.status_code == 200
#     error_message = "WARNING: Application health check failed!"
#   }
# }

# --- Key difference from variable validation ---
# validation {} → blocks execution if condition fails (hard stop)
# check {}     → only warns, plan/apply still succeeds (soft check)
