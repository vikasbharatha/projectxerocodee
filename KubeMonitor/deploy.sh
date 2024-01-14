#!/bin/bash

# Set AWS credentials
export AWS_ACCESS_KEY_ID="AKIA4DXBUR76ZTDEAJF3"
export AWS_SECRET_ACCESS_KEY="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"

# Set Terraform variables
export TF_VAR_aws_access_key="$AWS_ACCESS_KEY_ID"
export TF_VAR_aws_secret_key="$AWS_SECRET_ACCESS_KEY"

# Run Terraform to provision infrastructure
cd terraform
terraform init
terraform apply -auto-approve

# Get the public IP from Terraform output
PUBLIC_IP=$(terraform output -raw public_ip)

# Run Ansible playbook to deploy KubeMonitor
cd ../ansible
ansible-playbook -i "$PUBLIC_IP," -e "ansible_ssh_user=ec2-user" playbook.yml
