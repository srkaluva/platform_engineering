# Prometheus

## Purpose

Prometheus is the metrics collection system for the platform.

It scrapes metrics from:

- Kubernetes nodes
- Kubernetes pods
- Metrics Server
- Sock Shop services
- Future platform components

## Installation

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo update

kubectl create namespace monitoring

helm install prometheus \
  prometheus-community/prometheus \
  -n monitoring
```

## Validation

```bash
helm list -n monitoring
```

```bash
kubectl get pods -n monitoring
```

```bash
kubectl get svc -n monitoring
```

## Access

```bash
kubectl port-forward svc/prometheus-server \
  9090:80 \
  -n monitoring
```

Open:

http://localhost:9090

## Role in Platform

Prometheus provides the Metrics pillar of Observability.
``