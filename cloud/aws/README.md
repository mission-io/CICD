# AWS CICD

[AWS Cli - Examples](https://github.com/aws/aws-cli/tree/develop/awscli/examples)


[Dockerfile](https://github.com/mission-io/DevOps/blob/dev/cloud/aws/Dockerfile)

```dockerfile
    FROM ubuntu:latest
    RUN apt update && apt install awscli -y
    RUN adduser --disabled-password --gecos '' aws
    RUN apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    USER aws
 ```
 

[Dockerfile-dev](https://github.com/mission-io/DevOps/blob/dev/cloud/aws/Dockerfile-dev)

```dockerfile
    FROM ubuntu:latest
    RUN apt update && apt install awscli -y
    RUN apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
```    

Usage
```shell
    $ docker build -t mission/aws:v1 .
    $ docker run -d mission/aws:v1
```

[How to set environment variables](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)
```shell
    $ export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
    $ export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
    $ export AWS_DEFAULT_REGION=us-west-2
```

Create ECR Repo
```shell
aws ecr create-repository --repository-name book-session
```

Trigger Code Build in AWS
```shell
aws codebuild start-build --project-name BookSession
```
