# ============================================================
# Removed Blocks (Terraform 1.7+)
# ============================================================
# Safely remove resources from Terraform management.
# Two modes:
#   destroy = false → remove from state, keep the actual cloud resource
#   destroy = true  → remove from state AND delete the cloud resource

# --- Example 1: Stop managing a resource (keep it alive) ---
# Use this when handing off a resource to another team or tool.

# removed {
#   from = aws_s3_bucket.legacy_data
#
#   lifecycle {
#     destroy = false
#   }
# }

# --- Example 2: Remove and destroy a resource ---
# Use this when decommissioning old infrastructure.

# removed {
#   from = aws_instance.temp_build_server
#
#   lifecycle {
#     destroy = true
#   }
# }

# --- How it works ---
# 1. Delete the resource block from your .tf files
# 2. Add the removed block in its place
# 3. Run terraform plan — shows the intended action
# 4. Run terraform apply — executes it
# 5. Remove the removed block after apply
#
# Without a removed block, deleting a resource block causes Terraform
# to destroy the cloud resource. The removed block with destroy=false
# prevents that destruction.

# --- Why not just terraform state rm? ---
# The removed block is version-controlled and reviewable in PRs.
# terraform state rm is a manual CLI operation that leaves no trace
# in code. The removed block is the declarative, team-friendly approach.
