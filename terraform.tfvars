# VPC Configuration
cidr_block               = "10.0.0.0/16"
subnet_cidr_block        = "10.0.1.0/24"
public_subnet_cidr_block = "10.0.2.0/24"
availability_zone        = "us-east-1a"
vpc_name                 = "demo-vpc"
allowed_ips              = ["79.115.202.25/32"]

# EC2 Configuration
vm_count  = 4
vm_prefix = "demo-ec2"
vm_flavor = ["t2.micro", "t2.micro", "t2.micro", "t2.micro"]
vm_image  = ["ami-0182f373e66f89c85", "ami-0182f373e66f89c85", "ami-0182f373e66f89c85", "ami-0182f373e66f89c85"]
