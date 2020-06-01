FROM alpine
ENV TERRAFORM_VERSION=0.12.26
RUN addgroup -S terraform && adduser -S terraform -G terraform
RUN apk update
RUN apk add make curl unzip  wget git
RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime
RUN cd /tmp && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/* && \
    rm -rf /var/tmp/*
USER terraform
CMD ["/bin/bash"]

