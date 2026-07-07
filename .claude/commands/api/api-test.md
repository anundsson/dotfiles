---
description: Generate tests for API endpoints in Go or TypeScript
model: claude-sonnet-4-6
---

Generate comprehensive tests for the following API endpoint(s).

## Target

$ARGUMENTS

## Standards

### General
- Test **happy paths**, **error cases**, and **edge cases**
- Include **integration tests** that hit actual endpoints (not just unit tests)
- Test **validation** — invalid inputs, missing fields, boundary values
- Test **authentication/authorization** if applicable
- Use **table-driven tests** for multiple input scenarios
- Include **request/response assertions** (status codes, headers, body)

### Go
- Use standard `testing` package with `httptest`
- Table-driven tests with clear test case names
- Use `t.Parallel()` where safe
- Include `TestMain` setup if shared state is needed

### TypeScript
- Use Vitest or Jest with supertest
- Use `describe`/`it` blocks with clear descriptions
- Include setup/teardown for test fixtures
- Mock external dependencies, not the API itself

## Output

Generate test files that:
1. Cover all response codes the endpoint can return
2. Validate response body structure and content
3. Test boundary conditions and invalid inputs
4. Can run in CI without external dependencies (or document what's needed)
