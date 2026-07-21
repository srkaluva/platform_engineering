#!/bin/bash

set -e

echo "Deploying platform-demo..."

kubectl apply \
  -f applications/platform-demo/k8s/

echo "Deployment complete"

kubectl get pods
``