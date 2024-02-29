# Amazon EKS Terraform Deployment

This Terraform project automates the deployment of an Amazon EKS (Elastic Kubernetes Service) cluster on AWS. The infrastructure includes the necessary networking components such as VPC, subnets, and security groups along with the EKS cluster itself.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- **AWS Account**: You need an AWS account with appropriate permissions to deploy resources.
- **Terraform**: Make sure Terraform is installed on your local machine or VM. You can download it from [here](https://www.terraform.io/downloads.html) and follow the installation instructions.
- **Git**: You need Git installed to clone the repository. You can download it from [here](https://git-scm.com/downloads) and follow the installation instructions.

## Clone Repository

To get started, clone this repository to your local machine or VM using the following command:

```bash
git clone https://github.com/GKprojects/eksterraform

 The project structure is organized as follows




.
├── backend.tf
├── main.tf
├── modules
│   ├── eks
│   │   ├── main.tf
│   │   └── variable.tf
│   └── vpc
│       ├── main.tf
│       ├── output.tf
│       └── variable.tf
├── provider.tf
├── terraform.tfstate
├── terraform.tfstate.backup
└── variable.tf

```
### Initialize Terraform: 

Initialize the project to download necessary providers and modules.
```
    terraform init

```
### Plan Infrastructure

Create an execution plan to preview the changes Terraform will make.


```
    terraform plan

```
### Apply Changes
Apply the Terraform configurations to create the EKS cluster and related infrastructure.


```
    terraform apply