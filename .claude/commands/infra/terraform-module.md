---
description: Scaffold a Terraform module with variables, outputs, and documentation
model: claude-sonnet-4-6
---

Create a Terraform module based on the following requirements.

## Requirements

$ARGUMENTS

## Module Structure

Generate the following files:
- `main.tf` — primary resource definitions
- `variables.tf` — input variables with descriptions, types, and sensible defaults
- `outputs.tf` — useful outputs for module consumers
- `versions.tf` — required providers and version constraints
- `README.md` — usage examples, input/output documentation

## Standards

- Use **Azure** as the default provider unless specified otherwise
- Follow HashiCorp's module structure conventions
- Include `description` on every variable and output
- Use `validation` blocks for variables where appropriate
- Add `lifecycle` blocks where they prevent accidental destruction
- Tag all resources with `environment`, `managed_by = "terraform"`, and `project`
- Use `locals` for computed values and naming conventions
- No hardcoded values — everything parameterized

## Output

Generate each file with proper HCL formatting. Include a working example in the README.
