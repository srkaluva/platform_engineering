# Promtail

## Purpose

Promtail runs on Kubernetes nodes and collects container logs.

It forwards logs to Loki.

## Installation

```bash
helm install promtail \
  grafana/promtail \
  -n monitoring \
  --set config.clients[0].url=http://loki:3100/loki/api/v1/push
```

## Validation

```bash
kubectl get daemonset -n monitoring
```

```bash
kubectl get pods -n monitoring
```

## Verify Logs

Open Grafana.

Navigate to:

Explore → Loki

Query:

```text
{namespace="sock-shop"}
```

## Role in Platform

Promtail ships application and infrastructure logs to Loki.