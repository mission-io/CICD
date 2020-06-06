# Google Cloud

    FROM ubuntu:latest
    ENV ReleaseName=bionic
    RUN apt update && apt install apt-transport-https ca-certificates gnupg curl -y
    RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
    RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
    RUN apt update && apt install google-cloud-sdk -y
    RUN adduser --disabled-password --gecos '' googlecloud 
    RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    USER googlecloud
    CMD [/bin/bash]

Privileges User:

    FROM ubuntu:latest
    ENV ReleaseName=bionic
    RUN apt update && apt install apt-transport-https ca-certificates gnupg curl -y
    RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
    RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
    RUN apt update && apt install google-cloud-sdk -y
    RUN adduser --disabled-password --gecos '' googlecloud 
    RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    CMD [/bin/bash]



Authentication gcloud

    gcloud auth activate-service-account --key-file ~/Downloads/smooth-19-2cced1abedfc.json
    gcloud config set project [project name]
    gcloud config set run/region [region name]



