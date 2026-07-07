# Anundio — Claude Code Configuration

This repository is André's personal Claude Code plugin for Anundio, a solo IT consultancy based in Sweden. It contains agents, commands, and settings optimized for cloud-native consulting, DevOps, infrastructure architecture, and business operations.

## Who This Is For

André is a freelance IT consultant who works across the full stack — from infrastructure and DevOps to microservice development. The plugin reflects this breadth with both **technical** and **business** agents and commands.

## Technical Stack (Primary)

| Area | Current Tools | Notes |
|------|--------------|-------|
| Cloud | **Azure** (primary), multi-cloud | All agents should default to Azure but support AWS/GCP patterns |
| IaC | **Terraform**, **Bicep** | Extensible — more tools will be added |
| Containers | **Kubernetes**, **Docker** | Extensible — more runtimes will be added |
| Languages | **Go**, **TypeScript** | Extensible — more languages will be added |
| CI/CD | **GitHub Actions**, **Azure DevOps** | Extensible — more platforms will be added |
| Observability | **ELK Stack**, **Loki + Grafana** | Extensible — more stacks will be added |

When suggesting solutions, **prefer the primary tools above** but never hard-code assumptions — the stack is designed to grow.

## Business Context

- Solo consultancy in **Sweden** — Swedish tax law, Skatteverket rules, and GDPR apply
- Uses **Bookio** for business operations
- Currently sells consulting hours; transitioning toward **productized services**
- Business agents should understand Swedish freelance/consulting context (F-skatt, momsdeklaration, etc.)

## Repository Structure

```
.claude/
  agents/              # Specialized sub-agents
    technical/         # DevOps, infra, backend, security, etc.
    business/          # Proposals, accounting, legal, sales, strategy
  commands/            # Slash commands (invoked via /)
    infra/             # IaC, K8s, Docker commands
    cicd/              # CI/CD pipeline commands
    api/               # API/microservice commands
    business/          # Proposals, invoicing, scoping
    misc/              # General dev commands (lint, docs, cleanup)
  settings.json        # Project-level permissions
  settings.local.json  # Local overrides (not committed)
.claude-plugin/
  plugin.json          # Plugin manifest
  marketplace.json     # Marketplace listing
```

## Adding a New Agent

1. Create `.claude/agents/<category>/<agent-name>.md` with frontmatter:
   ```markdown
   ---
   name: agent-name
   description: One-line description of when to invoke this agent
   category: technical | business
   ---
   ```
2. Write a focused system prompt: role, triggers, behavioral mindset, focus areas, key actions, outputs, boundaries
3. Register in `.claude-plugin/plugin.json` under `agents`

## Adding a New Command

1. Create `.claude/commands/<category>/<command-name>.md` with:
   ```markdown
   ---
   description: What this command does
   ---
   Command prompt. Use $ARGUMENTS for user input.
   ```
2. Register in `.claude-plugin/plugin.json` under `commands`

## Conventions

- **Agents**: Include triggers, behavioral mindset, focus areas, key actions, outputs, and boundaries
- **Commands**: Single-purpose, use `$ARGUMENTS` for user input
- **Models**: Use `claude-sonnet-4-6` for commands/agents unless a task clearly warrants opus
- **No time estimates**: Never include time estimations — they're unreliable
- **Scalability**: Design all agents and commands to be tool-agnostic where possible; reference specific tools as current defaults, not hard requirements
- **Swedish context**: Business agents must account for Swedish law, tax, and regulatory environment
- **Security first**: Zero-trust principles, least privilege, defense in depth
- **Type safety**: Enforce TypeScript/Go best practices — no `any` types, no untyped patterns

## Validation

No build steps — pure configuration. Validate by:
- Ensuring frontmatter is valid YAML
- Ensuring plugin.json references match actual file paths
- Testing commands in a real project after installing
