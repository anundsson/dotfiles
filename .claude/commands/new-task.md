---
description: Analyze task complexity and create actionable implementation plan
model: claude-sonnet-4-6
---

Analyze the following task and create a clear, actionable implementation plan.

## Task

$ARGUMENTS

## Analysis Framework

### 1. Task Breakdown
- Understand requirements
- Identify dependencies
- List affected files/components/services
- Estimate complexity (Small / Medium / Large / Very Large)

### 2. Complexity Assessment
- **Small**: Config change, minor fix, simple script
- **Medium**: New endpoint, new module, moderate refactor, new pipeline
- **Large**: New service, multi-service feature, significant infrastructure change
- **Very Large**: Architecture change, data migration, multi-system integration

### 3. Risk Assessment
Identify potential blockers:
- Unknown dependencies or undocumented behavior
- Infrastructure limitations or cloud service constraints
- Data migration or backward compatibility needs
- Third-party service dependencies
- Security or compliance implications

### 4. Implementation Steps
Create sequential, logical steps:
1. Discovery / investigation
2. Infrastructure changes (if needed)
3. Backend / service changes
4. Pipeline / deployment changes
5. Testing and validation
6. Documentation
7. Rollout plan

### 5. Success Criteria
Define "done":
- Functionality works as specified
- Tests pass (unit, integration, e2e as appropriate)
- No regressions
- Infrastructure is reproducible (IaC)
- Monitoring and alerting in place
- Documented

## Output

### Task Analysis
- **Type**: [Bug Fix / Feature / Refactor / Infrastructure / DevOps / Business]
- **Complexity**: [Small / Medium / Large / Very Large]
- **Priority**: [High / Medium / Low]

### Implementation Plan
**Phase 1: [Name]**
- [ ] Step 1
- [ ] Step 2

### Files / Services to Modify
```
service-name/path/file.go (modify)
infra/modules/new-module/ (create)
.github/workflows/deploy.yml (modify)
```

### Dependencies
```bash
# Tools, packages, or services needed
```

### Testing Strategy
- Unit tests for X
- Integration tests for Y
- Load tests for Z (if applicable)

### Potential Issues
- Issue 1 and mitigation
- Issue 2 and mitigation

Provide a clear, solo-developer-friendly plan that breaks down complex tasks into manageable steps.
