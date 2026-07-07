---
description: Generate an optimized, multi-stage Dockerfile for a service
model: claude-sonnet-4-6
---

Create an optimized Dockerfile for the following service.

## Service Details

$ARGUMENTS

## Standards

- Use **multi-stage builds** to minimize final image size
- Start from official base images with specific version tags (no `latest`)
- Run as **non-root user** in the final stage
- Use `.dockerignore` patterns (generate a `.dockerignore` file too)
- Order layers for optimal caching (dependencies before source code)
- Use `HEALTHCHECK` instruction where applicable
- Include `LABEL` metadata (maintainer, version, description)
- Pin package manager versions where possible
- Minimize layer count in the final stage

### Language-Specific Defaults
- **Go**: Build with `CGO_ENABLED=0`, use `scratch` or `distroless` as final base
- **TypeScript/Node**: Use `node:*-alpine`, separate dependency install from build, prune dev dependencies

## Output

Generate:
1. `Dockerfile` — optimized multi-stage build
2. `.dockerignore` — exclude unnecessary files
3. Brief comments explaining non-obvious choices
