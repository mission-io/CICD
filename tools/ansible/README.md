
Ansible Alpine image

    FROM alpine
    RUN addgroup -S ansible && adduser -S ansible -G ansible
    RUN apk add --update ansible bash
    RUN rm -rf /var/cache/apk/*
    USER ansible
    CMD [/bin/bash]


    FROM alpine
    RUN addgroup -S ansible && adduser -S ansible -G ansible
    RUN apk add --update ansible bash
    RUN rm -rf /var/cache/apk/*
    CMD [/bin/bash]
