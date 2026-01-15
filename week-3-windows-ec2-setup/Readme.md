## Task Decription

The objective of this week is to securely deploy a windows server instance in AWS and configure access.

The instance must be accessible via **Remote Desktop (RDP)**. COnfigure the associated security Group to allow RDP access only from your IP address for security.

## CONFIGURATION
- The infra directory contains IaC files to provision the necessary resources.
- Include a .tfvars for actual values (add to .gitignore after implementation)
- Run `terraform init`, `terraform plan -out=<filename>`, then `terraform apply <filename>`.
