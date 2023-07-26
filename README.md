# Deploy an application using kubernetes

This project is to deploy a simple application using kubernetes.

# Architectural Diagram
![Architectural diagram 2](https://github.com/Funabowale/grayl_project/assets/140447545/b8fb1525-d1a9-4e58-9f6f-42ec2aca9054)

# EKS Terraform Setup

This project includes Terraform configuration to set up an Amazon EKS cluster on AWS.

## Prerequisites

1. AWS CLI installed and configured with the necessary credentials.
2. Terraform CLI installed on your local machine.
4. Docker installed on your local machine.
5. A Docker repository set up to store the Docker image.


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

Tag the Docker image with your Docker repository and push it:

```bash
docker tag image-name repo/image-name
docker push repo/image-name
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

## Monitoring of EKS cluster and pods
Use helm repository to install Prometheus and Grafana
Note:you can follow this guide to setup your Prometheus and Grafana
(https://catalog.workshops.aws/running-batch-on-eks/en-US/exercises/calculate-pi/setup-prometheus-grafana)
