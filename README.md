# DevOps-FinalProject-Part1

This project came to demonstrate how to expose web application with Application Load Balancer on AWS. <br/>
<p align="center">
  <img src="https://github.com/coheneria/devops-finalproject-part1/blob/main/files/photos/part1.png" width="100%" height="100%" />
</p>

## Tools used for this project :
Terraform - for deploy our infrastructure on AWS. <br/>
Ansible - for deploy and configure Docker containers. <br/>
ALB - Application load balancer on AWS to expose our application to the world. <br/>

## Quick Start

### 01. Create Key Pair for access the instance from AWS:
```bash
part1-public-key
```

### 02. Put the key on:
```bash
cd /home/ubuntu
vi key.pem
```

### 03. Gave the key a permission of:
```bash
chmod 600 key.pem
```

### 04. Export your AWS Credientals:
```bash
export AWS_ACCESS_KEY=""
export AWS_SECRET_KEY=""
```

### 05. Clone repository and run terraform as follow:
```bash
git clone https://github.com/coheneria/devops-finalproject-part1.git
cd devops-finalproject-part1/terraform
terraform init
rettafom plan
terraform apply -auto-approve
```

### 06. Destroy the infrastructure when finish:
```bash
terraform destroy -auto-approve
```