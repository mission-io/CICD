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

AWS sample `buildspec.yml` file
```yml
version: 0.2
env:
  variables:
    LATEST_TAG: "latest"
    AWS_ACCESS_KEY_ID: "AKIAUU73DHJ24BSOI574"
    AWS_SECRET_ACCESS_KEY: ""
    DEFAULT_REGION_NAME: "us-east-2"
    ECR_PATH: "319964789365.dkr.ecr.us-east-2.amazonaws.com"
    PROJECT_NAME: "BookSession"
    CONTAINER_NAME: "book-session"
    
#  parameter-store:
#    LOGIN_PASSWORD: /CodeBuild/dockerLoginPassword
phases:
  install:
    runtime-versions:
      java: corretto8
  pre_build:
    commands:
      - echo Nothing to do in the pre_build phase...
      - echo Entered the pre_build phase...
      - aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
      - aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
      - aws configure set region $DEFAULT_REGION_NAME
      - echo $(aws ecr get-login-password)|docker login --password-stdin --username AWS $ECR_PATH
  build:
    commands:
      - echo Build started on `date`
      - echo Entered the build phase and started build started on `date`
      - cd $PROJECT_NAME
      - mvn clean install
      - docker build -t $CONTAINER_NAME .
      - docker tag $CONTAINER_NAME:latest $ECR_PATH/$CONTAINER_NAME
      - docker push $ECR_PATH/$CONTAINER_NAME
  post_build:
    commands:
      - echo Build completed on `date`
artifacts:
 files:
   - target/book-session-1.0.jar

```


Trigger Code Build in AWS
```shell
aws codebuild start-build --project-name BookSession
```
