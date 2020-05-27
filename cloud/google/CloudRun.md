# Cloud Rrun
[gcloud run deploy command reference](https://cloud.google.com/sdk/gcloud/reference/run/deploy)

# Deploy

```shell
gcloud run deploy get-credible-corporate-service-new \
    --image gcr.io/animated-radar-271100/get-credible-corporate-service-new:latest \
    --region us-east4 \
    --allow-unauthenticated \
    --max-instances=2 \
    --port=80 \
    --set-env-vars KEY1=VALUE1 \
    --platform managed
```