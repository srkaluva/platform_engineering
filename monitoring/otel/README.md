# OpenTelemetry

## Purpose

OpenTelemetry collects distributed traces across microservices.

It helps understand:

- Request flow
- Service dependencies
- Response times
- Bottlenecks

## Installation

```bash
helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts

helm repo update

helm install otel-collector \
  open-telemetry/opentelemetry-collector \
  -n monitoring
```

## Validation

```bash
kubectl get pods -n monitoring
```

```bash
helm list -n monitoring
```

## Future Integration

- Jaeger
- Grafana Tempo
- Grafana tracing

## Role in Platform

OpenTelemetry provides the Tracing pillar of Observability.