#!/bin/bash

set -e

kubectl delete \
  -f applications/platform-demo/k8s/
``