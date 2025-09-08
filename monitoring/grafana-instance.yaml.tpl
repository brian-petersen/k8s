apiVersion: grafana.integreatly.org/v1beta1
kind: Grafana
metadata:
  name: grafana
  namespace: monitoring
  labels:
    dashboards: grafana
spec:
  config:
    security:
      admin_user: {{ op://Personal/Grafana/username }}
      admin_password: {{ op://Personal/Grafana/password }}
