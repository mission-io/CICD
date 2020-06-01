# AWS CICD

[AWS Cli - Examples](https://github.com/aws/aws-cli/tree/develop/awscli/examples)

[Dockerfile](https://github.com/mission-io/DevOps/blob/dev/cloud/aws/Dockerfile)

    FROM ubuntu:latest
    ENV ReleaseName=bionic
    RUN apt update && apt install awscli -y
    RUN adduser --disabled-password --gecos '' aws
    RUN apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    USER aws

[How to set environment variables](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

    $ export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
    $ export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
    $ export AWS_DEFAULT_REGION=us-west-2

Usage

    $ docker build -t mission-ui .
    $ docker run -d mission-ui:v1
