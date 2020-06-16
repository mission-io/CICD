    FROM alpine
    ENV PACKER_VERSION=1.6.0
    RUN addgroup -S packer && adduser -S packer -G packer
    RUN apk update && \
        apk add curl jq python bash ca-certificates git openssl unzip wget && \
        cd /tmp && \
        wget https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip && \
        unzip terraform_${PACKER_VERSION}_linux_amd64.zip -d /usr/bin && \
        rm -rf /tmp/* && \
        rm -rf /var/cache/apk/* && \
        rm -rf /var/tmp/*
    USER packer
    CMD [/bin/bash]
