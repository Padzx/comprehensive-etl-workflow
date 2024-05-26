#!/bin/bash

# Fail script on any error
set -e

# Ensure the required environment variables are set
if [ -z "$AWS_ACCESS_KEY_ID" ] || [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
  echo "AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY environment variables must be set"
  exit 1
fi

# Install Terraform if not installed
if ! command -v terraform &> /dev/null; then
  echo "Terraform not found. Installing..."
  wget https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_linux_amd64.zip
  unzip terraform_1.0.0_linux_amd64.zip
  sudo mv terraform /usr/local/bin/
  rm terraform_1.0.0_linux_amd64.zip
fi

# Create a Terraform variables file
cat <<EOF > terraform.tfvars
aws_access_key = "$AWS_ACCESS_KEY_ID"
aws_secret_key = "$AWS_SECRET_ACCESS_KEY"
EOF

# Navigate to the Terraform configuration directory
cd "$(dirname "$0")/../ci"

# Initialize Terraform
terraform init

# Plan and apply the Terraform configuration
terraform plan -out=tfplan
terraform apply -auto-approve tfplan
