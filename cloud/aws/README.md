# AWS CICD

[AWS Cli - Examples](https://github.com/aws/aws-cli/tree/develop/awscli/examples)


        # PRODUCTION ENVIRONMENT


[Dockerfile](https://github.com/mission-io/DevOps/blob/dev/cloud/aws/Dockerfile)

    FROM ubuntu:latest
    RUN apt update && apt install awscli -y
    RUN adduser --disabled-password --gecos '' aws
    RUN apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    USER aws

* note: This images build as non-root privileges. you cannot install any other packages.


        # DEVELOPMENT ENVIRONMENT    


[Dockerfile](https://github.com/mission-io/DevOps/blob/dev/cloud/aws/Dockerfile-dev)

    FROM ubuntu:latest
    RUN apt update && apt install awscli -y
    RUN apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

* note: This images build root privileges. you can install any other packages.

[How to set environment variables](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

    $ export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
    $ export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
    $ export AWS_DEFAULT_REGION=us-west-2

Usage

    $ docker build -t mission/aws:v1 .
    $ docker run -d mission/aws:v1
