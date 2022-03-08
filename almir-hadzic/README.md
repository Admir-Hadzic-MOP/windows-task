# Devops Engineer Assignment

This repository contains Terraform code and Powershell scripts to create necessary infrastructure for this task.

## Usage

### Terrafrom

Terraform code is inside terraform folder.

Few variables are required when running code. We can write needed variables in "terraform.tfvars" file or we can type them when running terraform command. Example of "terraform.tfvars" file is included.

To create terraform execution plan run:
```bash
terraform plan
```

To create all infrastructure or make changes on existing infrastructure run:
```bash
terraform apply
```

To clean up and destroy all infrastructure you make with this terraform code run:
```bash
terraform destroy
```

### Powershell Configuration Scripts

Initial configuration scripts for servers are included inside "powershell_configuration_scripts" folder.