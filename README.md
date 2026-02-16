# Three-Tier-Web-App

# Three-Tier Serverless Web Application (AWS + Terraform)

## Overview

This project implements a production-style three-tier serverless architecture on AWS using Terraform (Infrastructure as Code).

The application delivers a static frontend through CloudFront, exposes a REST API via API Gateway, executes backend logic in AWS Lambda, and integrates with DynamoDB.

The infrastructure is fully automated and reproducible using Terraform.

---

## Architecture

### Logical Flow

```
User (Browser)
    ↓
CloudFront (CDN)
    ↓
S3 (Static Frontend)
    ↓
API Gateway (/hello)
    ↓
Lambda Function
    ↓
DynamoDB
```

---

## AWS Services Used

- **Amazon S3** – Static website hosting  
- **Amazon CloudFront** – Secure global content delivery  
- **Amazon API Gateway** – REST API endpoint  
- **AWS Lambda (Python)** – Serverless backend logic  
- **Amazon DynamoDB** – NoSQL database  
- **IAM** – Secure role-based permissions  
- **Terraform** – Infrastructure as Code  

---

## Key Features

- Infrastructure fully provisioned using Terraform  
- Secure S3 access via CloudFront Origin Access Control (OAC)  
- Lambda proxy integration with API Gateway  
- Proper CORS configuration for browser-based API calls  
- Lifecycle management for API Gateway deployments  
- Source code hashing for automatic Lambda updates  
- Clean project structure with separation of concerns  

---

## Deployment Instructions

### Prerequisites

- AWS CLI configured
- Terraform (v1.5+ recommended)
- IAM user with appropriate permissions

Verify setup:

```bash
aws sts get-caller-identity
terraform -v
```

---

### Initialize Terraform

```bash
terraform init
```

---

### Deploy Infrastructure

```bash
terraform apply
```

Type `yes` when prompted.

Terraform will provision:

- DynamoDB table
- IAM roles
- Lambda function
- API Gateway (REST API + Stage)
- S3 bucket
- CloudFront distribution

---

### Access the Application

After deployment:

```bash
terraform output
```

Open the CloudFront domain in your browser.

Click **Call API** to trigger the backend Lambda function.

---

## API Testing

You can test the API directly:

```bash
curl https://<api-id>.execute-api.us-east-1.amazonaws.com/prod/hello
```

Expected response:

```
Hello from Lambda!
```
---

## Security Design

- S3 bucket is not publicly exposed  
- CloudFront uses Origin Access Control (OAC)  
- IAM follows least-privilege principle  
- CORS headers properly configured in Lambda responses  
- No hardcoded credentials  

---

## Project Structure

```
three-tier-serverless/
│
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── versions.tf
│
├── lambda/
│   ├── app.py
│   └── function.zip
│
└── frontend/
    └── index.html
```

---

## Cleanup

To destroy all resources:

```bash
terraform destroy
```

---

## Future Enhancements

- Persist and retrieve records from DynamoDB  
- Return structured JSON responses  
- Add input form on frontend  
- Implement CI/CD pipeline (GitHub Actions)  
- Add custom domain with ACM certificate  
- Enable CloudWatch monitoring and logging  

---

## Why This Project Matters

This project demonstrates:

- End-to-end cloud architecture design  
- Infrastructure automation with Terraform  
- Secure serverless implementation  
- Real-world debugging of CORS and CloudFront caching  
- Production-style AWS deployment patterns  
