# Google Kubernetes Engine (GKE) [Ref](https://medium.com/codeops/how-to-setup-auto-deployment-to-gke-with-bitbucket-pipelines-547d19bf8ccc)

## 1. Create Service Account
* Click on IAM & Admin on the navigation bar.
* On the IAM & Admin Console click on Service Accounts.
* Click on CREATE SERVICE ACCOUNT
* Enter account details and click CREATE
* Select Storage Admin as role in `Service Account Permission`.
* This will automatically down a json secret key onto your machine.(keep this file secured)
* Create variables in Bitbucket/Any Pipeline GCLOUD_API_KEYFILE is the content of your json secret key which was downloaded in previous step.
## Bitbucket Deployment Script 1

```yaml
    - step:
        name: Build and Push Docker Image
        image: google/cloud-sdk:latest
        script:
        - echo $GCLOUD_API_KEYFILE > ~/.gcloud-api-key.json
        - gcloud auth activate-service-account --key-file ~/.gcloud-api-key.json
        - docker login -u _json_key --password-stdin https://$DOCKER_GCR_REPO_URL < ~/.gcloud-api-key.json
        - docker build -t $DOCKER_IMAGE_NAME:${BITBUCKET_COMMIT} .
        - docker tag $DOCKER_IMAGE_NAME:${BITBUCKET_COMMIT} $DOCKER_GCR_REPO_URL/$GCLOUD_PROJECT_ID/$DOCKER_IMAGE_NAME:${BITBUCKET_COMMIT}
        - docker push $DOCKER_GCR_REPO_URL/$GCLOUD_PROJECT_ID/$DOCKER_IMAGE_NAME:${BITBUCKET_COMMIT}
        - gcloud container clusters get-credentials $K8s_CLUSTER_NAME --zone=$GCLOUD_ZONE --project $GCLOUD_PROJECT_ID
# DEPLOYMENT
        - kubectl set image deployment $K8s_DEPLOYMENT_NAME $K8s_DEPLOYMENT_NAME=$DOCKER_GCR_REPO_URL/$GCLOUD_PROJECT_ID/$DOCKER_IMAGE_NAME:${BITBUCKET_COMMIT} --record --namespace=$K8s_NAMESPACE
```
## Bitbucket Deployment script 2 

```yaml
    - step:
        name: Deploy
        deployment: production
        script:
          - sed -i "s|{{image}}|$DOCKER_HUB_USERNAME/$APPLICATION_NAME:$BITBUCKET_COMMIT|g" deployment.yml
          - pipe: atlassian/kubectl-run:1.1.2
            variables:
              KUBE_CONFIG: $KUBE_CONFIG
              KUBECTL_COMMAND: 'apply'
              RESOURCE_PATH: 'deployment.yml'
``
