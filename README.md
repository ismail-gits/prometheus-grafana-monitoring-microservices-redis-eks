# Monitoring Microservices Online Shop Application with Prometheus, Grafana and EKS

This repository contains comprehensive configurations for monitoring a microservices-based online shop application using Prometheus and Grafana. The setup includes Kubernetes deployment files for the application's microservices, configurations for monitoring Redis, and Terraform scripts for provisioning an AWS EKS cluster.

## Directory Structure

The project is organized as follows:

- **online-shop-microservices-app**: Contains configuration files for Kubernetes deployments and services for each microservice in the online shop application.
- **redis-monitoring**: Holds configurations for monitoring Redis using Prometheus.
- **terraform-aws-eks**: Includes Terraform scripts for provisioning an AWS EKS cluster along with necessary modules for VPC and EKS.

## Description

### Online Shop Microservices Application

The `online-shop-microservices-app` directory contains YAML files for Kubernetes deployments and services for various microservices in the online shop application. Each microservice has its own deployment and service configuration file.

- **Microservices Deployments**: Each deployment file (`<service-name>-deployment.yaml`) defines the replica count, image, ports, environment variables, probes, and resource limits for the corresponding microservice.
- **Services**: Service files (`<service-name>-service.yaml`) define ClusterIP type services to expose the microservices within the Kubernetes cluster.

### Redis Monitoring

The `redis-monitoring` directory includes configurations for monitoring Redis using Prometheus. It consists of Helm values and alert rules for setting up monitoring.

- **Helm Values**: The `helm-values.yaml` file contains configurations for installing Prometheus and Grafana Helm charts, enabling ServiceMonitor for Redis, and specifying the Redis address.
- **Alert Rules**: The `redis-alert-rules.yaml` file defines alert rules for monitoring Redis health and performance.

### Terraform AWS EKS

The `terraform-aws-eks` directory holds Terraform scripts for creating an AWS EKS cluster. It includes files for configuring the EKS cluster, VPC, and necessary variables.

- **Cluster Configuration**: The `eks-cluster.tf` file defines the provider, EKS cluster, and node group configurations using Terraform's AWS provider.
- **Terraform Variables**: The `terraform.tfvars` file contains variables for specifying the AWS region, VPC CIDR block, and subnet CIDR blocks.
- **VPC Configuration**: The `vpc.tf` file defines the VPC, subnets, and associated tags required for the EKS cluster.

## Prerequisites

Ensure you have the following installed before proceeding:

- Helm
- Terraform
- AWS account credentials configured locally

## Getting Started

1. **Deploy AWS EKS Cluster**:
   - Navigate to the `terraform-aws-eks` directory.
   - Update `terraform.tfvars` with your AWS region and subnet configurations.
   - Run `terraform init` and `terraform apply` to provision the EKS cluster.

2. **Create Microservices Namespace**:
   - Before deploying the microservices, create a Kubernetes namespace named `microservices` using the following command:
     ```bash
     kubectl create namespace microservices
     ```

3. **Deploy Microservices**:
   - Apply the Kubernetes deployment and service configurations for each microservice using `kubectl apply -f <service-name>-deployment.yaml -n microservices`.

4. **Import Helm Chart for Prometheus**:
    - Add the Prometheus Community Helm repository:
        ```bash
        helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
        ```
    - Update the repository to ensure you get the latest charts:
        ```bash
        helm repo update
        ```
    - Install the Prometheus chart from the Prometheus Community repository:
        ```bash
        helm install prometheus prometheus-community/kube-prometheus-stack
        ```

5. **Set up Redis Monitoring**:
   - Apply the Redis monitoring configurations located in the `redis-monitoring` directory.

6. **Access Prometheus**:
    - Prometheus: After installing Prometheus using Helm, access the Prometheus dashboard by port-forwarding:
    ```bash
    kubectl port-forward service/prometheus-kube-prometheus-prometheus 9090:9090 -n <namespace>
    ```
    Access Prometheus at [http://localhost:9090](http://localhost:9090).

7. **Access Grafana Dashboard**:
    - Grafana: Similarly, access the Grafana dashboard by port-forwarding:
     ```bash
     kubectl port-forward service/prometheus-grafana 3000:3000 -n <namespace>
     ```
     Access Grafana at [http://localhost:3000](http://localhost:3000).
    - Import the provided Grafana dashboard for monitoring.
