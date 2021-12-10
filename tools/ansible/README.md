# Ansible


### Help

### Ansible Commands
```
ansible <hosts> -a command
ansible all -a "/sbin/reboot"


ansible <hosts> -m <module>
ansible all -m ping

```

### Ansible Playbook commands

```
ansible-doc -l

ansible-playbook playbook.yml

ansible-playbook --help
```

### Inventry file
```path = /etc/ansible/hosts```

ansible_host = server1.company.com
ansible_connection = ssh/winrm/localhost
ansible_port = 22/5986
ansible_user = root/administrator
ansible_ssh_pass = Password

Security = Ansible vault

### Execute Ansible 

```shell

ansible target1 -m ping  -i inventry.txt
```

### Ansibl loop example playbook

```yaml
-
    name: 'Install required packages'
    hosts: localhost
    vars:
        packages:
            - httpd
            - binutils
            - glibc
            - ksh
            - libaio
            - libXext
            - gcc
            - make
            - sysstat
            - unixODBC
            - mongodb
            - nodejs
            - grunt
    tasks:
        -
            yum:
                name: '{{ item }}'
                state: present
            with_items: '{{ packages }}'
      
```

Ansible Alpine image

```dockerfile
    FROM alpine
    RUN addgroup -S ansible && adduser -S ansible -G ansible
    RUN apk add --update ansible bash
    RUN rm -rf /var/cache/apk/*
    USER ansible
    CMD [/bin/bash]
```

Privileges user
```dockerfile
    FROM alpine
    RUN addgroup -S ansible && adduser -S ansible -G ansible
    RUN apk add --update ansible bash
    RUN rm -rf /var/cache/apk/*
    CMD [/bin/bash]
```

Ansible ubuntu image
```dockerfile
    FROM ubuntu
    RUN apt update
    RUN apt install ansible -y
    RUN adduser --disabled-password --gecos '' ansible
    RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    USER ansible
    CMD [/bin/bash]
``` 

Privileges user
```dockerfile
    FROM ubuntu
    RUN apt update
    RUN apt install ansible -y
    RUN adduser --disabled-password --gecos '' ansible
    RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    CMD [/bin/bash]
```
