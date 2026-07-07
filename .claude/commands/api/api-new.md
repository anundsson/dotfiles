---
description: Scaffold a new microservice API endpoint in Go or TypeScript
model: claude-sonnet-4-6
---

Create a new API endpoint or microservice based on the following requirements.

## Requirements

$ARGUMENTS

## Standards

### General
- Include **request validation** with proper error responses
- Add **structured logging** (JSON format for ELK/Loki ingestion)
- Include **health check** endpoint (`/healthz` and `/readyz`)
- Add **OpenAPI/Swagger** documentation annotations
- Use **proper HTTP status codes** and consistent error response format
- Include **middleware**: request ID, logging, recovery/panic handling, CORS

### Go
- Use standard library `net/http` or lightweight router (chi, gorilla/mux)
- Follow Go project layout conventions (`cmd/`, `internal/`, `pkg/`)
- Use `context.Context` for cancellation and timeouts
- Return errors, don't panic — handle all error paths
- Include `Makefile` with build, test, lint targets

### TypeScript
- Use Express, Fastify, or Hono based on requirements
- Strict TypeScript — no `any` types
- Use Zod or similar for runtime validation
- Include proper type definitions for request/response

## Output

Generate the endpoint code with:
1. Handler/controller with validation and error handling
2. Route registration
3. Request/response type definitions
4. Basic tests
