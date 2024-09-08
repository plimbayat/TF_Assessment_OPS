# TF_Assessment_OPS

This Terraform project automates the deployment of a configurable number of virtual machines (VMs) in a Virtual Private Cloud (VPC) or virtual network. The project allows you to specify the VM flavor and image, and automatically generates unique admin passwords for each VM. Additionally, the project tests network connectivity between the VMs by performing round-robin ping tests, recording the results, and aggregating the outputs.

## Prerequisites

Before running this Terraform script, ensure that you have the following:

- **Terraform** installed on your local machine. [Download Terraform](https://www.terraform.io/downloads.html)
- **AWS CLI** configured with appropriate credentials, if deploying on AWS.
- An **SSH key** for secure access to the VMs.

## Terraform Variables

### Required Variables
The following variables must be configured to deploy the VMs:

- `vm_count`: The number of VMs to create (must be between 2 and 100).
- `vm_flavor`: The instance type or flavor of the VMs (e.g., `t2.micro` for AWS).
- `vm_image`: The AMI ID or image ID for the VMs.

### Example `terraform.tfvars` File

```hcl
vm_count  = 4
vm_prefix = "demo-ec2"
vm_flavor = ["t2.micro", "t2.micro", "t2.micro", "t2.micro"]
vm_image  = ["ami-0182f373e66f89c85", "ami-0182f373e66f89c85", "ami-0182f373e66f89c85", "ami-0182f373e66f89c85"]
hcl```


###If you're deploying resources on AWS, configure your AWS CLI with your credentials:
aws configure

###Before running Terraform, you need to initialize it. This will download the necessary provider plugins:
terraform init

###Plan the Deployment
terraform plan
terraform apply OR if you want skip the "yes" option terraform apply -auto-approve

###Round-Robin Ping Test
After deploying the VMs, the Terraform script will automatically perform a round-robin ping test:

VM 0 pings VM 1
VM 1 pings VM 2
VM 2 pings VM 0

###The results of each ping (pass/fail) are recorded and aggregated into a single Terraform output variable.
final_output.txt

###To destroy the infrastructure and clean up all resources, run:
terraform destroy



