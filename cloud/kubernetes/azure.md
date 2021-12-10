# Azure AKS

### [Login in Azure](https://docs.microsoft.com/en-us/cli/azure/authenticate-azure-cli)

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

### [Connect to the cluster](https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough)

```sh
az aks get-credentials --resource-group myResourceGroup --name myAKSCluster

kubectl get nodes
```
