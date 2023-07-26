# EKS Terraform Setup

This project includes Terraform configuration to set up an Amazon EKS cluster on AWS.

## Prerequisites

1. AWS CLI installed and configured with the necessary credentials.
2. Terraform CLI installed on your local machine.
3. Docker installed on your local machine.
4. A Docker repository set up to store the Docker image.

## Setting Up the EKS Cluster

1. Navigate to the `eks-terraform` directory.

2. Open terraform files to review and adjust the Terraform configurations based on your requirements (e.g., region, instance types, cluster name, etc.).

3. Run the following commands to create the EKS cluster:
   ```bash
   terraform init
   terraform apply
    ```

## Building and Pushing the Docker Image
Ensure you are in the root directory of the project.

Open Dockerfile and review the Docker configuration.

Build the Docker image using the following command:
```bash
docker build -t image-name .   
```

Tag the Docker image with your Docker repository URI and push it:

```bash
docker tag image-name repo/image-name
docker push  funadunrepo/image-name
```

## Deploying the Nginx App to EKS
Ensure the EKS cluster is up and running.

Navigate to the manifest directory.

Open kube-manifest.yaml and ensure that the Docker image in the manifest matches the Docker image.

Note: you will have to generate kube config (https://repost.aws/knowledge-center/eks-generate-kubeconfig-file-for-cluster)

Deploy the Nginx app to the EKS cluster using kubectl:

```bash
kubectl apply -f nginx-manifest.yml
```

## Accessing the Nginx App
Use the kubectl get services command
```bash
kubectl get services
```
to find the external IP address (or DNS name) of the LoadBalancer service associated with the Nginx app.

Access the Nginx app using the external IP address (or DNS name) and port as follows: xxxxx:port

