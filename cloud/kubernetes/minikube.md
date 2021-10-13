# Minikube

## Start Minikube
```shell
minikube start --cpus=4 --memory=8g --disk-size=25g --container-runtime=[docker | crio]
```
## Access minikube docker environment
```shell
eval $(minikube docker-env)
```