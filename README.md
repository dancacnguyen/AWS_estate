Project Name: Real Estate Website
Goal: Establish a secure, scalable, two-tier AWS architecture using Terraform.


Prerequisites:

Terraform CLI installed.
AWS CLI configured with credentials.
GitHub account.

NOTES!!!: There is a hidden file called .gitignore, which would safely allow us
to git add, commit without worrying about the .tfstate files.

PLANNING to have each person work on each file.

backend.tf - State configuration

vpc.tf - VPC, Subnets, Internet/Nat Gateways

security_groups.tf - Ingress/Egress Rules (ALB, Web, RDS)

compute.tf - Launch Template, Auto Scaling Group

rds.tf - RDS instance and subnet Groups
