
Ansible Alpine image

    FROM alpine
    RUN addgroup -S ansible && adduser -S ansible -G ansible
    RUN apk add --update ansible bash
    RUN rm -rf /var/cache/apk/*
    USER ansible
    CMD [/bin/bash]

Privileges user

    FROM alpine
    RUN addgroup -S ansible && adduser -S ansible -G ansible
    RUN apk add --update ansible bash
    RUN rm -rf /var/cache/apk/*
    CMD [/bin/bash]

Ansible ubuntu image

    FROM ubuntu
    RUN apt update
    RUN apt install ansible -y
    RUN adduser --disabled-password --gecos '' ansible
    RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    USER ansible
    CMD [/bin/bash]
    
Privileges user

    FROM ubuntu
    RUN apt update
    RUN apt install ansible -y
    RUN adduser --disabled-password --gecos '' ansible
    RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    CMD [/bin/bash]
