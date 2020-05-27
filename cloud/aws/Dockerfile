FROM ubuntu:latest
ENV ReleaseName=bionic
RUN apt update && apt install awscli -y
RUN adduser --disabled-password --gecos '' aws
RUN apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
USER aws
