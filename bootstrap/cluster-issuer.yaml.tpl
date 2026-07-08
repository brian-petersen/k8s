apiVersion: v1
kind: Secret
metadata:
  name: cloudflare-api-token
  namespace: cert-manager
stringData:
  api-token: {{ op://Personal/6yq53uhhkhamgo4yzlqecrzi3q/token }}
---
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt
spec:
  acme:
    server: https://acme-v02.api.letsencrypt.org/directory
    email: {{ op://Personal/6yq53uhhkhamgo4yzlqecrzi3q/email }}
    privateKeySecretRef:
      name: letsencrypt-key
    solvers:
    - dns01:
        cloudflare:
          apiTokenSecretRef:
            name: cloudflare-api-token
            key: api-token
