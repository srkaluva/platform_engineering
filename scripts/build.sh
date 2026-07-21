#!/bin/bash

set -e

source scripts/env.sh

echo "Building frontend image..."

docker buildx build \
  --platform linux/amd64 \
  -t ${FRONTEND_REPO}:${IMAGE_TAG} \
  applications/platform-demo/frontend

echo "Building payment image..."

docker buildx build \
  --platform linux/amd64 \
  -t ${PAYMENT_REPO}:${IMAGE_TAG} \
  applications/platform-demo/payment

echo "Build complete"
