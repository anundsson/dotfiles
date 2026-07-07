---
description: Run linting and fix code quality issues
model: claude-sonnet-4-6
---

Run linting tools and fix any issues found in the specified code.

## Target

$ARGUMENTS

## Actions

1. **Identify the language** and appropriate linting tools:
   - **Go**: `golangci-lint run`, `go vet`, `gofmt`
   - **TypeScript**: `eslint`, `tsc --noEmit`
   - **Terraform**: `terraform validate`, `terraform fmt`, `tflint`
   - **Bicep**: `az bicep lint`, `az bicep build`
   - **Docker**: `hadolint`
   - **YAML**: `yamllint`
   - **Markdown**: `markdownlint`

2. **Run the linter(s)** and capture output
3. **Fix auto-fixable issues** (formatting, import order, etc.)
4. **Report remaining issues** that need manual attention
5. **Verify** the fixes don't change behavior

## Output

- Summary of issues found and fixed
- List of remaining issues that need manual resolution
- Any suggested configuration changes for the linter
