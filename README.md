# gitops-example-158
gitops-example-158


Commands to run:
minikube start --driver=docker
kubectl get nodes

helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm search repo argocd

helm show values argo/argo-cd --version 3.35.4  > argocd-defaults.yaml
helm status argocd -n argocd
helm list --pending -A

helm list -A
kubectl get pods -n argocd
kubectl get secret -n argocd

kubectl get secrets argocd-initial-admin-secret -o yaml -n argocd
echo "TGpUVHRkcC0wMktVZ0dVcA==" | base64 -d | LjTTtdp-02KUgGUp
kubectl port-forward svc/argocd-server -n argocd 8080:80

username: admin
password from above

Next is setting up public repo and public image 

Now in 1-example is where we deploy using argocd and give reference to application
Once you have the application.yaml file run the kubectl command
kubectl apply -f 1-example/application.yaml

You need to apply maunally in argocd application 
Click on sync it will work automatically from now on 

And to automate this process of tagging the image to the infra repo is done through a small example of upgrade.sh
And make it executable 