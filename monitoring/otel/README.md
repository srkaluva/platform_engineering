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
# OpenTelemetry Collector

Purpose:
- Receive telemetry
- Process telemetry
- Export telemetry

Installation:

helm install otel-collector \
  open-telemetry/opentelemetry-collector \
  -n monitoring \
  --set mode=deployment \
  --set image.repository=ghcr.io/open-telemetry/opentelemetry-collector-releases/opentelemetry-collector-k8s \
  --set command.name=otelcol-k8s

Validation:

kubectl get pods -n monitoring

kubectl logs -n monitoring deployment/otel-collector-opentelemetry-collector

```bash
kubectl get pods -n monitoring
```

```bash
helm list -n monitoring
```

## Future Integration

- Jaeger
# Install jaeger
```bash
helm repo add jaegertracing https://jaegertracing.github.io/helm-charts

helm repo update

helm install jaeger \
  jaegertracing/jaeger \
  -n monitoring

```
# verify and access
kubectl get pods -n monitoring
kubectl port-forward svc/jaeger-query \
  16686:16686 \
  -n monitoring

  http://localhost:16686

- Grafana Tempo
- Grafana tracing

## Role in Platform

OpenTelemetry provides the Tracing pillar of Observability.