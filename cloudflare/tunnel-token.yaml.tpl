apiVersion: v1
kind: Secret
data:
  token: {{ op://Personal/n8-k8s cloudflare tunnel token/base64 }}
metadata:
  name: tunnel-token
  namespace: cloudflare
type: Opaque
