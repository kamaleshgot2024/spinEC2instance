# AWS Infrastructure with Terraform

This Terraform configuration creates a basic AWS infrastructure setup with a VPC, public subnet, and EC2 instance.

## Infrastructure Components

- VPC with DNS support
- Public subnet in ap-south-1a
- Internet Gateway
- Route Table with public route
- Security Group (SSH access)
- EC2 instance (t2.micro with Amazon Linux 2)

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS credentials configured
- AWS CLI installed (optional)

## File Structure

```
.
├── main.tf          # Main infrastructure configuration
├── data.tf          # Data sources for AMI lookup
├── .gitignore       # Git ignore file
└── README.md        # This file
```

## Usage

1. Initialize Terraform:
```bash
terraform init
```

2. Review the planned changes:
```bash
terraform plan
```

3. Apply the configuration:
```bash
terraform apply
```

4. To destroy the infrastructure:
```bash
terraform destroy
```

## Resource Details

### VPC Configuration
- CIDR Block: 10.0.0.0/16
- DNS hostnames enabled
- DNS support enabled

### Subnet Configuration
- CIDR Block: 10.0.1.0/24
- Auto-assign public IPs enabled
- Availability Zone: ap-south-1a

### Security Group Rules
- Inbound: TCP port 22 (SSH) from 0.0.0.0/0
- Outbound: All traffic allowed

### EC2 Instance
- Type: t2.micro
- AMI: Latest Amazon Linux 2 (automatically fetched)
- Placed in public subnet
- Associated with security group

## Important Notes

1. Security Considerations:
   - The security group allows SSH from anywhere (0.0.0.0/0)
   - Consider restricting SSH access to specific IPs for production use

2. Costs:
   - Resources created may incur AWS charges
   - Remember to run `terraform destroy` when done testing

3. Region:
   - Currently configured for ap-south-1 (Mumbai)
   - Modify provider block in main.tf to change region

## Git Version Control

Ensure the following files are not committed:
- .terraform/
- terraform.tfstate
- terraform.tfstate.backup
- *.tfvars

The .terraform.lock.hcl file should be committed to ensure consistent provider versions.

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request