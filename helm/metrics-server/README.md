# Metrics Server

Purpose:
- Collect node metrics
- Collect pod metrics
- Enable kubectl top
- Enable Horizontal Pod Autoscaler

Installation:

helm install metrics-server metrics-server/metrics-server \
  --namespace metrics-server \
  --create-namespace

Validation:

kubectl top nodes
kubectl top pods -A