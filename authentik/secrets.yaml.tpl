apiVersion: v1
kind: Secret
metadata:
  name: authentik-credentials
  namespace: authentik
type: Opaque
stringData:
  AUTHENTIK_SECRET_KEY: {{ op://Personal/Authentik Secrets/secret_key }}
