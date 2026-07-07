---
description: Scaffold an Azure Bicep module with parameters, outputs, and documentation
model: claude-sonnet-4-6
---

Create an Azure Bicep module based on the following requirements.

## Requirements

$ARGUMENTS

## Module Structure

Generate the following files:
- `main.bicep` — primary resource definitions
- `main.bicepparam` — example parameter file
- `README.md` — usage examples and parameter documentation

## Standards

- Use latest stable Azure API versions
- Include `@description()` decorators on all parameters and outputs
- Use `@allowed()`, `@minLength()`, `@maxLength()` decorators where appropriate
- Define proper `dependsOn` where implicit dependencies aren't sufficient
- Tag all resources with `environment`, `managedBy: 'bicep'`, and `project`
- Use variables for computed values and naming conventions
- Follow Azure naming conventions (e.g., `rg-`, `vnet-`, `aks-` prefixes)
- Include `existing` resource references where appropriate

## Output

Generate each file with proper Bicep formatting. Include a deployment example in the README using `az deployment group create`.
