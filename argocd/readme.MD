
#Step 1: Create Namespace
kubectl create namespace argocd

#Verify:

kubectl get ns

#Step 2: Add Argo Helm Repository
helm repo add argo https://argoproj.github.io/argo-helm

helm repo update

#Step 3: Install Argo CD

Create:

argocd/
└── values.yaml

#Minimal argocd/values.yaml:

```Yaml
server:
  service:
    type: LoadBalancer

    ```


##Install:

helm install argocd argo/argo-cd -n argocd -f argocd/values.yaml

Step 4: Verify Pods

kubectl get pods -n argocd

Expected:
argocd-application-controller
argocd-dex-server
argocd-redis
argocd-repo-server
argocd-server


All should eventually be:

Step 5: Get Argo CD URL

kubectl get svc -n argocd
Show more lines

If using:

LoadBalancer


you'll see:

argocd-server

with an external hostname.

Open:


https://<load-balancer-url>

``
Show more lines
Step 6: Get Initial Password

Argo stores the initial admin password in a secret.

kubectl get secret argocd-initial-admin-secret \
-n argocd \
-o jsonpath="{.data.password}" | base64 --decode


Step 7: Login

Username:
admin

Password:

<decoded password>


Deliverables:

Shell
1
kubectl get pods -n argocd
Show more lines

✅ UI accessible

✅ Logged in