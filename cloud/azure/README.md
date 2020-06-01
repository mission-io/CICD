# AZURE CICD

[AWS Cli - Examples](https://github.com/aws/aws-cli/tree/develop/awscli/examples)


[Dockerfile](https://github.com/mission-io/DevOps/blob/dev/cloud/aws/Dockerfile)

    FROM ubuntu
    ENV ReleaseName=bionic
    RUN apt update
    RUN apt-get install ca-certificates curl apt-transport-https lsb-release gnupg -y
    RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor |  tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null
    RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ ${ReleaseName} main" |  tee /etc/apt/sources.list.d/azure-cli.list
    RUN apt update && apt install -y azure-cli
    RUN apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    RUN adduser --disabled-password --gecos '' azure
    USER azure
 
 

[Dockerfile-dev](https://github.com/mission-io/DevOps/blob/dev/cloud/aws/Dockerfile-dev)

    FROM ubuntu
    ENV ReleaseName=bionic
    RUN apt update
    RUN apt-get install ca-certificates curl apt-transport-https lsb-release gnupg -y
    RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor |  tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null
    RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ ${ReleaseName} main" |  tee /etc/apt/sources.list.d/azure-cli.list
    RUN apt update && apt install -y azure-cli
    RUN apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

    

Usage

    $ docker build -t mission/azure:v1 .
    $ docker run -d mission/azure:v1
    
