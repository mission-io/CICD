# Angular Application Deployed in NGINX Web Server 

(Target OS is Windows)

## Covered in this document

1. Install the NGINX Web Server
2. Configure the NGINX Web Server by edit/copy the `nginx.conf` file
3. Run the NGINX as windows service
4. Zip the Angular distribution folder
5. Copy to the target machine
6. Remove existing deployment
7. Unzip the file

## Todo: 

1. Open the port in target machine security firewall

## `playbook.yml` file 

```yml
- hosts: {{HOSTS}}
  remote_user: root
  gather_facts: False

  pre_tasks:
  - debug: msg="Ansible is working!"
  - name: ping
    win_ping:

  tasks:
  # Install NGINX WebServer

  - name: Install NGINX
    win_chocolatey:
      name: nginx
      version: '1.12.1'
      state: present

  - name: Install nssm
    win_chocolatey:
      name: nssm
      state: present

  - name: Copy NGINX conf file
    win_template: 
      src: nginx.conf.tpl
      dest: C:\ProgramData\chocolatey\lib\nginx\tools\nginx-1.12.1\conf\nginx.conf

  - name: Copy Cert file 1
    win_template: 
      src: ../cert.pem
      dest: C:\ProgramData\chocolatey\lib\nginx\tools\nginx-1.12.1\conf\cert.pem

  - name: Copy Cert file 2
    win_template: 
      src: ../cert.key
      dest: C:\ProgramData\chocolatey\lib\nginx\tools\nginx-1.12.1\conf\cert.key

  - name: Create Log Folder
    win_file:
      path: C:\nginx
      state: directory

  - name: Install nginx as service
    win_nssm:
      name: nginx
      application: C:\ProgramData\chocolatey\lib\nginx\tools\nginx-1.12.1\nginx.exe
      app_parameters_free_form: -c C:\ProgramData\chocolatey\lib\nginx\tools\nginx-1.12.1\conf\nginx.conf -p C:\ProgramData\chocolatey\lib\nginx\tools\nginx-1.12.1
      stdout_file: C:\nginx\nginx_out.txt
      stderr_file: C:\nginx\nginx_error.txt
      start_mode: auto

  - name: Start Nginx
    win_service:
      name: nginx
      start_mode: auto
      state: started

  # - name: FirewallD rules
  #   firewalld:
  #     permanent: true
  #     service: "{{ item }}"
  #     state: enabled
  #   with_items:
  #     - http
  #     - https

  # Deploy the Angular Application

  - name: Archive the Angular Application
    archive:
      path: /opt/atlassian/pipelines/agent/build/dist/Mission-web
      dest: ./app.zip
      format: zip
    delegate_to: localhost
    become: false

  - name: Copy zip File to target
    win_copy: 
      src: ./app.zip
      dest: C:\ProgramData\chocolatey\lib\nginx\tools\nginx-1.12.1\

  - name: Unarchive
    win_unzip:
      src: C:\ProgramData\chocolatey\lib\nginx\tools\nginx-1.12.1\app.zip
      dest: C:\ProgramData\chocolatey\lib\nginx\tools\nginx-1.12.1\
      delete_archive: yes  

  - name: Remove existing ui deployment
    win_file:
      path: C:\ProgramData\chocolatey\lib\nginx\tools\nginx-1.12.1\html
      state: absent

  - name: Create Folder
    win_file:
      path: C:\ProgramData\chocolatey\lib\nginx\tools\nginx-1.12.1\html
      state: directory

  - name: Move Content 
    win_copy:
      remote_src: yes
      src: C:\ProgramData\chocolatey\lib\nginx\tools\nginx-1.12.1\Mission-web\
      dest: C:\ProgramData\chocolatey\lib\nginx\tools\nginx-1.12.1\html\

  - name: Remove directory structure
    win_file:
      path: C:\ProgramData\chocolatey\lib\nginx\tools\nginx-1.12.1\Mission-web
      state: absent
```
