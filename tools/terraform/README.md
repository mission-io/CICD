# Terraform Infrastructure CICD pipeline


Dockerfile

        FROM alpine
        ENV TERRAFORM_VERSION=0.12.25
        RUN addgroup -S terraform && adduser -S terraform -G terraform
        RUN apk update && \
            apk add curl jq python bash ca-certificates git openssl unzip wget && \
            cd /tmp && \
            wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
            unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin && \
            rm -rf /tmp/* && \
            rm -rf /var/cache/apk/* && \
            rm -rf /var/tmp/*
        USER terraform
        CMD [/bin/bash]

Privileges user:

        FROM alpine
        ENV TERRAFORM_VERSION=0.12.25
        RUN addgroup -S terraform && adduser -S terraform -G terraform
        RUN apk update && \
            apk add curl jq python bash ca-certificates git openssl unzip wget && \
            cd /tmp && \
            wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
            unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin && \
            rm -rf /tmp/* && \
            rm -rf /var/cache/apk/* && \
            rm -rf /var/tmp/*
        CMD [/bin/bash]
