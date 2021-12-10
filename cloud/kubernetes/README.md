# Kubernetes Cloud

### Basic Commands

```sh
kubectl exec -it <pod-name> -- [sh | bin/sh | bin/bash]

```

[Troubleshooting Kubernetes Deployments](https://learnk8s.io/troubleshooting-deployments)

# ubuntu Non-Privileges User
```Dockerfile
    FROM ubuntu:latest
    ENV helm_version=3.1.3
    RUN apt update && apt-get install -y curl tar wget
    RUN cd /tmp/ && wget https://get.helm.sh/helm-v${helm_version}-linux-amd64.tar.gz && tar -zxf helm-v${helm_version}-linux-amd64.tar.gz
    RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
    RUN chmod +x kubectl && mv kubectl /usr/local/bin && mv /tmp/linux-amd64/helm /usr/local/bin/
    RUN adduser --disabled-password --gecos '' kubernetes
    RUN apt clean && rm -rf /tmp/* 
    USER kubernetes
    CMD [/bin/bash]
 ```
 # ubuntu Privileges User
 ```Dockerfile
    FROM ubuntu:latest
    ENV helm_version=3.1.3
    RUN apt update && apt-get install -y curl tar wget
    RUN cd /tmp/ && wget https://get.helm.sh/helm-v${helm_version}-linux-amd64.tar.gz && tar -zxf helm-v${helm_version}-linux-amd64.tar.gz
    RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
    RUN chmod +x kubectl && mv kubectl /usr/local/bin && mv /tmp/linux-amd64/helm /usr/local/bin/
    RUN adduser --disabled-password --gecos '' kubernetes
    RUN apt clean && rm -rf /tmp/* 
    CMD [/bin/bash]
```    
# Alpine non-privileges user
```Dockerfile
    FROM alpine
    RUN addgroup -S kubernetes && adduser -S kubernetes -G kubernetes
    ENV helm_version=3.1.3
    RUN apk update && apk add curl jq python bash ca-certificates git openssl unzip wget tar
    RUN cd /tmp/ && wget https://get.helm.sh/helm-v${helm_version}-linux-amd64.tar.gz && tar -zxf helm-v${helm_version}-linux-amd64.tar.gz
    RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
    RUN chmod +x kubectl && mv kubectl /usr/local/bin && mv /tmp/linux-amd64/helm /usr/local/bin/
    RUN rm -rf /tmp/* 
    USER kubernetes
    CMD [/bin/bash]
```   
# Alpine privileges user

```Dockerfile
    FROM alpine
    RUN addgroup -S kubernetes && adduser -S kubernetes -G kubernetes
    ENV helm_version=3.1.3
    RUN apk update && apk add curl jq python bash ca-certificates git openssl unzip wget tar
    RUN cd /tmp/ && wget https://get.helm.sh/helm-v${helm_version}-linux-amd64.tar.gz && tar -zxf helm-v${helm_version}-linux-amd64.tar.gz
    RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
    RUN chmod +x kubectl && mv kubectl /usr/local/bin && mv /tmp/linux-amd64/helm /usr/local/bin/
    RUN rm -rf /tmp/* 
    CMD [/bin/bash]
```

# Multi cloud Setup
[Cloud Controller Manager](https://cloudyuga.guru/blog/cloud-controller-manager)
[Pull image from GCR](https://medium.com/hackernoon/today-i-learned-pull-docker-image-from-gcr-google-container-registry-in-any-non-gcp-kubernetes-5f8298f28969)
