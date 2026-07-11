# AGENTS.md — homelab k8s

Personal Kubernetes homelab config for `brian-petersen`. Domain: `luckywatcher.dev`.

## Secrets

- `.tpl` files contain `{{ op://... }}` 1Password CLI references.
- **Always inject before applying:** `cat file.yaml.tpl | op inject | kubectl apply -f -`
- Without `op inject`, the templates will fail.

## Deploy patterns

Two deployment methods coexist:

1. **Helmfile** — used for `bootstrap/`, `forgejo/`, `librechat/`. Operate from the subdirectory:
   ```sh
   cd bootstrap && helmfile diff && helmfile apply
   ```
   To remove a Helm release, add `installed: false` to the release entry in `helmfile.yaml`, run `helmfile apply`, then remove the entry.

2. **Raw YAML** — everything else (`audiobookshelf.yaml`, `calibre-web.yaml`, `cloudflare/`, `monitoring/`, `my-personal-space/`). Apply directly with `kubectl apply -f <file>`.

## Service exposure

All services are exposed through a single **Cloudflare Tunnel** (cloudflared). After deploying a new service, visit Cloudflare Zero Trust → Networks → Tunnels and add the ingress URL:
```
<service-name>.<namespace>.svc.cluster.local:<service-port>
```

## Required tools

- `helm`, `helmfile`, `helm-diff` plugin
- `kubectl`
- `op` (1Password CLI) for secrets

## No CI/CD

This repo has no CI, build system, tests, linters, or pre-commit hooks. It is pure YAML config.
