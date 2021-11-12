## Bitbucket pipeline sample - 1

It covers the following

1. Maven build
2. Push the artifacts to github 
3. How to skip build if we commit the verson change from CI process
4. Bitbucket shared/reuse stepes ([ref](https://support.atlassian.com/bitbucket-cloud/docs/yaml-anchors/)) & scripts ([ref](https://community.atlassian.com/t5/Bitbucket-questions/Bitbucket-pipeline-reuse-of-code/qaq-p/1134797))
5. Security Scan
6. File Upload and Download from Bitbucket download sections.
7. Install maven dependencies

```yaml
image: maven:3.8.1-jdk-8

definitions:
  steps:
    - step: &Build-App
        name: Build App
        caches:
          - maven
        script:
          - mvn install
        artifacts:
          - target/**
    - step: &Release-App
        name: Release App
        caches:
          - maven
        script:
          - mvn release:update-versions --batch-mode
          - mvn install
          - git add .
          - git commit -m "[skip CI]"
          - git push
        artifacts:
          - target/**
    - step: &Deploy-2-Github
        name: Deploy to Github
        deployment: Production
        script:
          - git config --global user.email "natarajang2@hexaware.com"
          - git config --global user.name "BB Build Trigger"
          - git clone https://${GIT_ACCESS_TOKEN}@github.com/mission-io/AppAssessment
          - ls -ls
          - cd AppAssessment
          - git checkout main
          - cp ../target/AppAssessment-*-SNAPSHOT.jar .
          - cp ../README.md .
          - git add .
          - git status
          - git commit -m "Latest jar updated. Build Number ${BITBUCKET_BUILD_NUMBER}"
          - git push origin main
pipelines:
  branches:
    develop:
      - step: *Build-App
    release:
      - step: *Release-App
      - step: *Deploy-2-Github
    feature/cicd:
      - step: *Release-App
      - step: *Deploy-2-Github

  ```
  
