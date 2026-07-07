---
description: Generate Kubernetes manifests for a workload (Deployment, Service, Ingress, etc.)
model: claude-sonnet-4-6
---

Create Kubernetes manifests for the following workload.

## Workload Details

$ARGUMENTS

## Standards

- Use current stable API versions
- Include proper **resource requests and limits**
- Add **liveness and readiness probes**
- Use **labels** consistently: `app.kubernetes.io/name`, `app.kubernetes.io/component`, `app.kubernetes.io/managed-by`
- Include **PodDisruptionBudget** for production workloads
- Use **Secrets** or **ExternalSecrets** for sensitive config (never plain ConfigMaps)
- Add **NetworkPolicy** restricting ingress/egress where appropriate
- Set `securityContext`: non-root, read-only filesystem, drop all capabilities
- Include **HPA** (HorizontalPodAutoscaler) if the workload is scalable
- Use **namespaces** to separate concerns

## Output

Generate separate YAML files (or a single multi-document YAML) for each resource:
- `deployment.yaml`
- `service.yaml`
- `ingress.yaml` (if externally exposed)
- `hpa.yaml` (if scalable)
- `networkpolicy.yaml`
- `pdb.yaml` (for production)

Include comments explaining non-obvious configuration choices.
