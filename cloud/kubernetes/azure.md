# Azure AKS

### 1. [Login in Azure](https://docs.microsoft.com/en-us/cli/azure/authenticate-azure-cli)

```sh
az login
(or)
az login -u <username> -p <password>
(or)
az login --service-principal -u <app-id> -p <password-or-cert> --tenant <tenant>
(or)
az login --identity
(or)
az login --identity --username <client_id|object_id|resource_id>
```

### 2. [Connect to the cluster](https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough)

```sh
az account set --subscription <subscription id>
az aks get-credentials --resource-group <ResourceGroup> --name <cluster name>

# Example 
az aks get-credentials --resource-group myResourceGroup --name myAKSCluster

kubectl get nodes
```

### 3. NGINX Ingress controller installation

1. NGINX Ingress Controller Official Reference
	1. [using Helm](https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-helm/)
	2. [using Kubectl](https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-manifests/)

#### Steps to install
```shell

```
2. NGINX Ingress Controller Kubernetes reference
	1. [using Kubectl](https://kubernetes.github.io/ingress-nginx/deploy/#azure)
	2. [using Helm]() - NA

### 4. Create an image pull secret

[Create an image pull secret](https://docs.microsoft.com/en-us/azure/container-registry/container-registry-auth-kubernetes#:~:text=your%20service%20principal.-,Create%20an%20image%20pull%20secret,password%2C%20and%20the%20registry%20URL.)

```shell

kubectl create secret docker-registry <secret-name> \
    --namespace <namespace> \
    --docker-server=<container-registry-name>.azurecr.io \
    --docker-username=<service-principal-ID> \
    --docker-password=<service-principal-password>
 
 ```
### 5 . Install certificate for ingress

```shell

	kubectl create secret tls aks-ingress-tls --key server.key --cert server.crt

# aks-ingress-tls -> spacify this secret name in pod `ingress.yml` -> `spec` -> `tls` -> `secretName` as follows

```

Sample `ingress.yml` file

```yml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-web-ui
  annotations:
    # use the shared ingress-nginx
    kubernetes.io/ingress.class: "nginx"
    ingress.kubernetes.io/force-ssl-redirect: "true"
    nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
spec:
  tls:
  - hosts:
    - test.mission.com
    secretName: aks-ingress-tls
  rules:
  - host: test.mission.com
    http:
      paths:
      - path: /missionforapp5/
        pathType: Prefix
        backend:
          service:
            name: mission-web-ui
            port:
              number: 80
```
