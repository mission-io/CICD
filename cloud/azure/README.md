

# Azure command line authentication creation

## create service principle

```shell
az ad sp create-for-rbac --name demoazureroute
```

Changing "demonio" to a valid URI of "http://demonio", which is the required format used for service principal names
Creating a role assignment under the scope of "/subscriptions/xxxxx-xxx-xxxxxxx"
{
  "appId": "a807906d-3cbc-xxxxx-ae2f-xxxxxxxxxx",
  "displayName": "demoazureroute",
  "name": "http://demoazureroute",
  "password": "C9~xxxxxxxx.4NH~6Aekfu_9-uzm4",
  "tenant": "xxxxx833fc-xxxx-49c9-9c53-xxxxxx"
}


Command Line login approaches (select 1 preferable ):

1. az login --service-principal -u a807906d-3cbc-xxxxx-ae2f-xxxxxxxxxx -p C9~UhyOOnK5p8gJL.4NH~6Aekfu_9-uzm4 --tenant xxxxx833fc-xxxx-49c9-9c53-xxxxxx    
2. az login --service-principal -u http://demoazureroute -p C9~xxxxxxxx.4NH~6Aekfu_9-uzm4 --tenant xxxxxxxxgmail.onmicrosoft.com
3. az login --service-principal -u http://demoazureroute -p C9~xxxxxxxx.4NH~6Aekfu_9-uzm4 --tenant xxxxx833fc-xxxx-49c9-9c53-xxxxxx


### Docker image build 

```shell
docker build -t azure-auth .
```

### Docker image and run

```shell
docker run -dti --name demoazureroute azure-auth
```

### Docker exection and verify

```shell
docker exec -ti demoazureroute bash
az group create --name TestResourceGroup --location westus
``` 
---

# For AZURE CICD

[Azure Cli - Examples](https://docs.microsoft.com/en-us/cli/azure/)

[Dockerfile](https://github.com/mission-io/DevOps/blob/dev/cloud/azure/Dockerfile)

```dockerfile
FROM ubuntu
ENV ReleaseName=bionic
RUN apt update
RUN apt-get install ca-certificates curl apt-transport-https lsb-release gnupg -y
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor |  tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ ${ReleaseName} main" |  tee /etc/apt/sources.list.d/azure-cli.list
RUN apt update && apt install -y azure-cli
RUN apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN adduser --disabled-password --gecos '' azure
USER azure
 ```
 

[Dockerfile-dev](https://github.com/mission-io/DevOps/blob/dev/cloud/azure/Dockerfile-dev)

```dockerfile
FROM ubuntu
ENV ReleaseName=bionic
RUN apt update
RUN apt-get install ca-certificates curl apt-transport-https lsb-release gnupg -y
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor |  tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ ${ReleaseName} main" |  tee /etc/apt/sources.list.d/azure-cli.list
RUN apt update && apt install -y azure-cli
RUN apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
```
    

### Usage

```shell
$ docker build -t mission/azure:v1 .
$ docker run -d mission/azure:v1
```
---
