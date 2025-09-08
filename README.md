# k8s

yaml files for my homelab k8s instance.

## Helmfile Tips

When setting up a new cluster:

1. `cd bootstrap`
1. `helmfile diff` - review changes
1. `helmfile apply`

To remove `helmfile` controlled things:

1. Add `installed: false` to `helmfile.yaml`
1. Review `helmfile diff`
1. Run `helmfile apply`
1. Remove the entry that `installed: false` was added to

## Applying Files

Any yaml files with sensitive information contain
1Password references. To apply them to the cluster:

    cat cloudflare/tunnel-token.yaml.tpl | op inject | kubectl apply -f -

## Exposing Services

Services are exposed via a cloudflared tunnel.
Once the service is stood up, some manual configuration
in cloudflare is necessary.

1. Visit [Cloudflare](https://cloudflare.com) and sign in
1. Visit Sign in > Zero Trust > Networks > Tunnels > Edit
1. Add the url to the service:
   `<service-name>.<namespace-name>.svc.cluster.local:<service-port>`

## Other Tips

- [Grafana Dashboards](https://grafana.com/grafana/dashboards/) -
  ids can be grabbed and added to
  `./monitoring/datasources-and-dashboards.yaml`
    - If the dashboard doesn't load,
    sometimes a datasources var has to be specified
- [Prometheus Helm Charts](https://github.com/prometheus-community/helm-charts/tree/main/charts) -
  additional services can be scraped if added
  - Think Redis, Erlang, etc.
