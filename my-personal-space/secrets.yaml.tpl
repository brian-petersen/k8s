apiVersion: v1
kind: Secret
metadata:
  name: my-personal-space-secrets
  namespace: my-personal-space
type: Opaque
stringData:
  SECRET_KEY_BASE: {{ op://Personal/MyPersonalSpace Secrets/SECRET_KEY_BASE }}
