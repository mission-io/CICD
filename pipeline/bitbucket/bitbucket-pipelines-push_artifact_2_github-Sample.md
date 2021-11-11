## Bitbucket pipeline sample - 2

It covers the following items.
1. Maven build
2. Push the artifacts to github 
3. How to skip build if we commit the verson change from CI process

```yaml

image: maven:3.8.1-jdk-8

pipelines:
  branches:
    develop:
      - step:
          name: Build App
          caches:
            - maven
          script:
            - mvn install
            - git commit -m "[skip CI]" # skip the build trigger
            - git push
    feature/cicd:
      - step:
          name: Build App
          caches:
            - maven
          script:
            - java -version
            - mvn -version
            - mvn install
          artifacts:
            - target/**
      - step:
          name: Deploy
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
  ```
  
