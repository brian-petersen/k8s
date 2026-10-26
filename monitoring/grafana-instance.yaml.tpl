apiVersion: grafana.integreatly.org/v1beta1
kind: Grafana
metadata:
  name: grafana
  namespace: monitoring
  labels:
    dashboards: grafana
spec:
  version: 13.2.4
  config:
    plugins:
      preinstall_auto_update: "false"
    security:
      admin_user: {{ op://Personal/Grafana/username }}
      admin_password: {{ op://Personal/Grafana/password }}
