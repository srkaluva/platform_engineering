helm install prometheus prometheus-community/prometheus \
  -n monitoring \
  -f values.yaml


  kubectl port-forward svc/prometheus-server 9090:80 -n monitoring



helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm install monitoring prometheus-community/kube-prometheus-stack \
  -n monitoring \
  --create-namespace

2. Verify ServiceMonitor CRD
Shell
kubectl get crd | grep servicemonitors

3. Create Application Service
apiVersion: v1
kind: Service
metadata:
  name: front-end
  namespace: sock-shop
  labels:
    app: front-end
spec:
  selector:
    app: front-end
  ports:
  - name: http
    port: 80
    targetPort: 8079

4. Create ServiceMonitor
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: frontend
  namespace: monitoring
spec:
  namespaceSelector:
    matchNames:
      - sock-shop

  selector:
    matchLabels:
      app: front-end

  endpoints:
  - port: http
    path: /metrics
    interval: 30s
``
