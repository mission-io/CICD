# AWS CICD

## AWS CLI Examples
[AWS Cli - Examples](https://github.com/aws/aws-cli/tree/develop/awscli/examples)



[Dockerfile](https://github.com/mission-io/DevOps/blob/dev/cloud/aws/Dockerfile)

    FROM ubuntu:latest
    ENV ReleaseName=bionic
    RUN apt update && apt install awscli -y
    RUN adduser --disabled-password --gecos '' aws
    RUN apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    USER aws
