---
description: Generate documentation for code, APIs, infrastructure, and runbooks
model: claude-sonnet-4-6
---

Generate documentation for the following.

## Target

$ARGUMENTS

## Documentation Types

Detect the appropriate type and generate accordingly:

### Code / Repository
- **README.md**: Purpose, prerequisites, quick start, configuration, development setup
- Include badges for CI status, coverage, etc. where applicable

### API
- **OpenAPI/Swagger spec** or **API reference** with request/response examples
- Include authentication requirements and error responses

### Infrastructure
- **Architecture diagram** (Mermaid) showing components and data flows
- **Deployment guide** with prerequisites and steps
- **Environment configuration** documentation

### Runbook
- **Step-by-step procedures** for operational tasks
- Include troubleshooting sections and rollback procedures
- Add monitoring/alerting check steps

## Standards

- Write for the person reading this at 2 AM during an incident
- Include **working examples** that can be copy-pasted
- Use **Mermaid** for diagrams (renders in GitHub, GitLab, Azure DevOps)
- Keep it concise — skip obvious things, explain non-obvious things
- Structure with clear headings and scannable format

## Output

Generate the documentation in Markdown format, ready to commit to the repository.
