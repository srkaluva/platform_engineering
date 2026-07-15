# Loki

## Purpose

Loki stores Kubernetes logs.

Logs are collected by Promtail and sent to Loki.

## Installation

```bash
helm repo add grafana https://grafana.github.io/helm-charts

helm repo update

helm install loki \
  grafana/loki \
  -n monitoring
```

## Validation

```bash
kubectl get pods -n monitoring
```

```bash
helm list -n monitoring
```

## Role in Platform

Loki provides the Logging pillar of Observability.