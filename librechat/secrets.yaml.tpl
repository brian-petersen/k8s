apiVersion: v1
kind: Secret
metadata:
  name: librechat-credentials
  namespace: librechat
type: Opaque
stringData:
  # Values can be generated from https://www.librechat.ai/toolkit/creds_generator
  CREDS_KEY: {{ op://Personal/LibreChat Creds/CREDS_KEY }}
  CREDS_IV: {{ op://Personal/LibreChat Creds/CREDS_IV }}
  JWT_SECRET: {{ op://Personal/LibreChat Creds/JWT_SECRET }}
  JWT_REFRESH_SECRET: {{ op://Personal/LibreChat Creds/JWT_REFRESH_SECRET }}
  MEILI_MASTER_KEY: {{ op://Personal/LibreChat Creds/MEILI_MASTER_KEYpassword }}

  CONTEXT7_API_KEY: {{ op://Personal/Context7 API Key/credential}}
