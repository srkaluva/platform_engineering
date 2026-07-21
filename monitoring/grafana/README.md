# Grafana

## Purpose

Grafana provides visualization for platform metrics.

Data sources:

- Prometheus
- Loki
- OpenTelemetry (future)

## Installation

```bash
helm repo add grafana https://grafana.github.io/helm-charts

helm repo update

helm install grafana \
  grafana/grafana \
  -n monitoring
```

## Retrieve Admin Password

```bash
kubectl get secret grafana \
  -n monitoring \
  -o jsonpath="{.data.admin-password}" | base64 --decode
```

## Access

```bash
kubectl port-forward svc/grafana \
  3000:80 \
  -n monitoring
```

Open:

http://localhost:3000

Username:

```text
admin
```

## Validation

```bash
kubectl get pods -n monitoring
```

```bash
helm list -n monitoring
```

## Role in Platform

Grafana visualizes:

- Metrics
- Logs
- Traces

## get secrets
kubectl get secret monitoring-grafana \
  -n monitoring \
  -o jsonpath="{.data.admin-user}" | base64 --decode

  kubectl get secret monitoring-grafana \
  -n monitoring \
  -o jsonpath="{.data.admin-password}" | base64 --decode