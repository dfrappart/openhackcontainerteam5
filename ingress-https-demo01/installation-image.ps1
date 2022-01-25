#Installation 
$NAMESPACE="web"

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

helm install ingress-nginx ingress-nginx/ingress-nginx --create-namespace --namespace $NAMESPACE 
#    
az aks enable-addons --addons azure-keyvault-secrets-provider --name aks-demo01 --resource-group rg-demo01
#
kubectl create namespace web
kubectl apply -f "D:\2022\training\openhack\src\dev\openhackcontainerteam5\demo01\secretproviderclass.yaml"
kubectl apply -f "D:\2022\training\openhack\src\dev\openhackcontainerteam5\demo01\demo.yaml"
kubectl apply -f "D:\2022\training\openhack\src\dev\openhackcontainerteam5\demo01\demo.service.yaml"



kubectl apply -f "D:\2022\training\openhack\src\dev\openhackcontainerteam5\demo01\clusterissuer.yaml"
kubectl apply -f "D:\2022\training\openhack\src\dev\openhackcontainerteam5\demo01\ingress.yaml"


#Commands
kubectl get pods -n web
kubectl get services -n web
kubectl get secrets -n web
kubectl get secret cert-secret -n web -o yaml