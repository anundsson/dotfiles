---
description: Scaffold a GitHub Actions workflow for CI/CD
model: claude-sonnet-4-6
---

Create a GitHub Actions workflow for the following requirements.

## Requirements

$ARGUMENTS

## Standards

- Use **specific action versions** (SHA pinning or `@v4`, never `@latest` or `@main`)
- Include **concurrency** groups to cancel redundant runs
- Use **job-level permissions** with least privilege (not workflow-level)
- Cache dependencies (Go modules, npm, Docker layers) where applicable
- Use **environments** for deployment workflows with required approvals
- Add **status checks** that gate merges
- Use **OIDC** for cloud provider authentication (Azure federated credentials) instead of stored secrets where possible
- Include proper **if conditions** for conditional steps
- Use **matrix strategies** for multi-version/multi-platform testing where appropriate
- Keep workflow files focused — one workflow per concern

## Output

Generate:
1. `.github/workflows/<name>.yml` — the workflow file
2. Brief description of triggers, jobs, and required secrets/variables
