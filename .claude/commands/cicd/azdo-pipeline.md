---
description: Scaffold an Azure DevOps pipeline for CI/CD
model: claude-sonnet-4-6
---

Create an Azure DevOps pipeline for the following requirements.

## Requirements

$ARGUMENTS

## Standards

- Use **YAML pipelines** (not classic editor)
- Use **templates** for reusable stages/jobs where appropriate
- Include proper **trigger** and **pr** configurations
- Use **variable groups** and **Key Vault** integration for secrets
- Define **environments** with approval gates for deployments
- Use **service connections** for Azure resource access
- Cache dependencies where applicable
- Include proper **condition** expressions for conditional stages
- Use **stages** to separate build, test, and deploy phases
- Add **pool** specifications with appropriate agent images

## Output

Generate:
1. `azure-pipelines.yml` — the pipeline definition
2. Any template files if the pipeline uses templates
3. Brief description of stages, required variable groups, and service connections
