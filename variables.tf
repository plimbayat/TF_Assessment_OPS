variable "cidr_block" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the subnet"
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability Zone"
  default     = "us-east-1a"
}

variable "vpc_name" {
  description = "VPC name"
}

variable "vm_count" {
  description = "The number of VMs to create"
  default     = 2

  validation {
    condition     = var.vm_count >= 2 && var.vm_count < 100
    error_message = "The number of VMs must be at least 2 and less than 100."
  }
}

variable "vm_flavor" {
  description = "The VM instance type"
  default     = ["t2.micro", "t2.micro"]
}

variable "vm_image" {
  description = "The VM AMI ID"
  default     = ["ami-0182f373e66f89c85", "ami-0182f373e66f89c85"]
}

variable "vm_prefix" {
  description = "VM Prefix"
}

variable "ec2_username" {
  description = "EC2 host username"
  default     = "tf-user"
}

variable "allowed_ips" {
  description = "Allow external IPs"
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for the public subnet"
}

variable "aws_key_name" {
  description = "AWS key name"
  default     = "ec2-key"
}