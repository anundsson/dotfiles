---
description: Refactor and clean up code following Go and TypeScript best practices
model: claude-sonnet-4-6
---

Review and clean up the following code or file(s).

## Target

$ARGUMENTS

## Cleanup Checklist

1. **Read the code first** — understand what it does before changing anything
2. **Identify issues**: dead code, duplication, unclear naming, overly complex logic
3. **Fix incrementally**: one concern at a time, verify behavior is preserved
4. **Apply language idioms**:
   - **Go**: error handling patterns, interface usage, package organization, naming conventions
   - **TypeScript**: proper typing (no `any`), null handling, async patterns, module structure
5. **Simplify**: reduce nesting, extract only when truly needed, prefer clarity over cleverness

## Standards

- Do NOT change behavior — this is cleanup, not feature work
- Do NOT add unnecessary abstractions or over-engineer
- Do NOT add comments for self-explanatory code
- Preserve existing test coverage — run tests after changes
- Keep changes minimal and focused

## Output

Provide the cleaned-up code with a brief summary of what was changed and why.
