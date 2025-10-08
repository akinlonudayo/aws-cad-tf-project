🧱 Project Overview

The setup includes:
🔹 VPC – Custom Virtual Private Cloud with public and private subnets for network isolation.
🔹 Application Load Balancer (ALB) – Distributes incoming traffic to EC2 instances in the public tier, ensuring high availability.
🔹 EC2 Instances – Act as the web/application layer running the app frontend.
🔹 RDS (MySQL/PostgreSQL) – Deployed in the private subnet as the secure backend database.

⚙️ Terraform Highlights
	•	Infrastructure defined and version-controlled using Terraform .tf files.
	•	Reusable variables and modules for network and compute resources.
	•	Automated provisioning and teardown with a single terraform apply / destroy command.
	•	Outputs configured for ALB DNS and RDS endpoints.

🌐 Why This Matters

This project reinforced how IaC simplifies cloud management — reducing human error, increasing repeatability, and enabling rapid deployment across environments.
