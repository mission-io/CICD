# Ansible in Bitbucket Example

```yaml

bitbucket-pipeline.yml
image: python:3.7
options:
 max-time: 10
pipelines:
  branches:
    development:
      - step:
          name: Deploy to DEV server
          caches:
            - pip
          script:
            - pip install ansible
            - ansible-playbook -i <inventory_file_path>  <ansible_playbook_path>
  ```
