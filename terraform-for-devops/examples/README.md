# Modern Terraform Feature Examples

These files demonstrate Terraform features added in versions 1.1 through 1.14.
Each file is self-contained with comments explaining the concept.

**These are reference examples, not a runnable configuration.**
Copy the patterns you need into your own project.

| File | Feature | Terraform Version |
|------|---------|-------------------|
| `for_each.tf` | `for_each` with resources and dynamic blocks | 0.12+ |
| `validation.tf` | Variable `validation {}` blocks | 1.0+ |
| `lifecycle.tf` | `lifecycle` meta-argument (prevent_destroy, ignore_changes) | 0.12+ |
| `moved.tf` | `moved {}` block for refactoring | 1.1+ |
| `import.tf` | `import {}` block for config-driven imports | 1.5+ |
| `check.tf` | `check {}` block for continuous assertions | 1.5+ |
| `removed.tf` | `removed {}` block for safe resource removal | 1.7+ |
| `terraform_test/` | Native `terraform test` framework | 1.6+ |

## How to Use

1. Read through each file to understand the syntax
2. Copy patterns into your real Terraform configurations
3. For `terraform_test/`, cd into the directory and run `terraform test`
