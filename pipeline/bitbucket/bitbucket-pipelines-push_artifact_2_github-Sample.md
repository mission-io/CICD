## Bitbucket pipeline sample - 1

It covers the following

1. Maven build
2. Enable the Maven Cache ([ref](https://support.atlassian.com/bitbucket-cloud/docs/cache-dependencies/))
3. Push the artifacts to github 
4. How to skip build if we commit the verson change from CI process
5. Bitbucket shared/reuse stepes ([ref](https://support.atlassian.com/bitbucket-cloud/docs/yaml-anchors/)) & scripts ([ref](https://community.atlassian.com/t5/Bitbucket-questions/Bitbucket-pipeline-reuse-of-code/qaq-p/1134797))
6. Security Scan
7. File Upload and Download from Bitbucket download sections.
8. Install maven dependencies

```yaml
image: maven:3.8.1-jdk-8

definitions:
  scripts:
    - script: &Build&CommitVersion-Script
        mvn install &&
        git add . &&
        git commit -m "[skip CI]" &&
        git push

    - script: &DependencyDownload&Install-Script
        mkdir bin &&
        cd bin &&
        curl -s -S  --user "${BITBUCKET_ACCESS_TOKEN}" -L -O "https://api.bitbucket.org/2.0/repositories/${BITBUCKET_REPO_OWNER}/${BITBUCKET_REPO_SLUG}/downloads/AppAssessmentCore-5.0.0-SNAPSHOT.jar" &&
        curl -s -S  --user "${BITBUCKET_ACCESS_TOKEN}" -L -O "https://api.bitbucket.org/2.0/repositories/${BITBUCKET_REPO_OWNER}/${BITBUCKET_REPO_SLUG}/downloads/app-authentication-2.0.0.jar" &&
        ls -ls &&
        mvn install:install-file -Dfile=./app-authentication-2.0.0.jar -DgroupId=com.mission-io.authentication -DartifactId=app-authentication -Dversion=2.0.0 -Dpackaging=jar -DgeneratePom=true &&
        mvn install:install-file -Dfile=./AppAssessmentCore-5.0.0-SNAPSHOT.jar -DgroupId=com.hex -DartifactId=AppAssessmentCore -Dversion=5.0.0-SNAPSHOT -Dpackaging=jar -DgeneratePom=true &&
        cd ..

  steps:
    - step: &Build-Authentication
        name: Build Authentication
        caches:
          - maven
        script:
          - pwd
          - ls -ls
          - git clone https://${BITBUCKET_ACCESS_TOKEN}@bitbucket.org/appmission-io/app-authentication.git
          - cd app-authentication
          - git checkout develop
          - mvn install
          #- mvn install:install-file -Dfile=./target/app-authentication-2.0.0.jar -DgroupId=com.mission-io.authentication -DartifactId=app-authentication -Dversion=2.0.0 -Dpackaging=jar -DgeneratePom=true
          - curl -X POST --user "${BITBUCKET_ACCESS_TOKEN}" "https://api.bitbucket.org/2.0/repositories/${BITBUCKET_REPO_OWNER}/${BITBUCKET_REPO_SLUG}/downloads" --form files=@"./target/app-authentication-2.0.0.jar"
        artifacts:
          - target/**
    - step: &Build-Backend
        name: Build Backend
        caches:
          - maven
        script:
          - pwd
          - ls -ls
          - git clone https://${BITBUCKET_ACCESS_TOKEN}@bitbucket.org/appmission-io/application-cloud-transformation-assessment-backend.git
          - cd application-cloud-transformation-assessment-backend
          - git checkout develop
          - mvn install
          #- mvn install:install-file -Dfile=./target/AppAssessmentCore-5.0.0-SNAPSHOT.jar -DgroupId=com.hex -DartifactId=AppAssessmentCore -Dversion=5.0.0-SNAPSHOT -Dpackaging=jar -DgeneratePom=true
          - curl -X POST --user "${BITBUCKET_ACCESS_TOKEN}" "https://api.bitbucket.org/2.0/repositories/${BITBUCKET_REPO_OWNER}/${BITBUCKET_REPO_SLUG}/downloads" --form files=@"./target/AppAssessmentCore-5.0.0-SNAPSHOT.jar"
        artifacts:
          - target/**
    - step: &Build-UI
        name: Build UI
        caches:
          - maven
        script:
          - *DependencyDownload&Install-Script
          - mvn install
        after-script:
            # Collect checkstyle results, if any, and convert to Bitbucket Code Insights.
          - pipe: atlassian/checkstyle-report:0.3.0
        artifacts:
          - target/**
    - step: &Release-UI
        name: Release UI
        caches:
          - maven
        script:
          - pwd
          - ls -ls
          - *DependencyDownload&Install-Script
          - mvn release:update-versions --batch-mode
          - *Build&CommitVersion-Script
        after-script:
            # Collect checkstyle results, if any, and convert to Bitbucket Code Insights.
          - pipe: atlassian/checkstyle-report:0.3.0
        artifacts:
          - target/**
    - step: &Push-2-Github
        name: Push to Github
        deployment: Production
        script:
          - git config --global user.email "natarajang2@mission-io.com"
          - git config --global user.name "Bitbucket Build Trigger"
          - git clone https://${GIT_ACCESS_TOKEN}@github.com/NatarajanGanapathi-mission-io/appAssessment
          - ls -ls
          - cd appAssessment
          - git checkout main
          - cp ../target/AppAssessment-*-SNAPSHOT.jar .
          - cp ../README.md .
          - git add .
          - git status
          - git commit -m "Latest jar updated. Build Number ${BITBUCKET_BUILD_NUMBER}"
          - git push origin main
    - step: &Security-Scan
        name: Security Scan
        script:
          # Run a security scan for sensitive data.
          # See more security tools at https://bitbucket.org/product/features/pipelines/integrations?&category=security
          - pipe: atlassian/git-secrets-scan:0.5.1

pipelines:
  branches:
    develop:
      - step: *Build-Authentication
      - step: *Build-Backend
      - step: *Build-UI
      - step: *Security-Scan
    feature/cicd:
      - step: *Build-Authentication
      - step: *Build-Backend
      - step: *Build-UI
      - step: *Security-Scan
  ```
  
### [Built in Bitbucket Variables](https://support.atlassian.com/bitbucket-cloud/docs/variables-and-secrets/)
### [Built in Bitbucket Cache](https://support.atlassian.com/bitbucket-cloud/docs/cache-dependencies/)
  
