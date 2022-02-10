# Amazon Elastic Kubernetes Service (EKS) [Ref](https://support.atlassian.com/bitbucket-cloud/docs/deploy-to-aws-eks-kubernetes/)

1. Install Latest version of AWS CLI( > 2.0)
2. AWS Login

  ```
  aws configure set aws_access_key_id "${AWS_ACCESS_KEY_ID}"
  aws configure set aws_secret_access_key "${AWS_SECRET_ACCESS_KEY}"
  aws configure set region "${DEFAULT_REGION_NAME}"
  
  ```

1. [Create Worker Node Role](https://docs.aws.amazon.com/eks/latest/userguide/create-node-role.html#create-worker-node-role)

## Kubeclt Context update in local [Ref](https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html)

```shell
#  Create or update the kubeconfig file for your cluster:
aws eks update-kubeconfig --region <region> --name <cluster_name>

```

## Verify ALB Ingress Controller logs

```
kubectl logs -f $(kubectl get po -n kube-system | egrep -o 'alb-ingress-controller-[A-Za-z0-9-]+' ) -n kube-system
```
