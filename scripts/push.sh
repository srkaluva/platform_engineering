#!/bin/bash

set -e

source scripts/env.sh

echo "Logging into ECR..."

aws ecr get-login-password \
  --region ${AWS_REGION} \
| docker login \
  --username AWS \
  --password-stdin \
  ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com

echo "Tagging images..."

docker tag \
  ${FRONTEND_REPO}:${IMAGE_TAG} \
  ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${FRONTEND_REPO}:${IMAGE_TAG}

docker tag \
  ${PAYMENT_REPO}:${IMAGE_TAG} \
  ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${PAYMENT_REPO}:${IMAGE_TAG}

echo "Pushing frontend..."

docker push \
  ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${FRONTEND_REPO}:${IMAGE_TAG}

echo "Pushing payment..."

docker push \
  ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${PAYMENT_REPO}:${IMAGE_TAG}

echo "Push complete"
``
