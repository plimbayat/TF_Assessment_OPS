variable "cidr_block" {
  description = "VPC CIDR block"
  type        = string
}

variable "subnet_cidr_block" {
  description = "Subnet CIDR block"
  type        = string
}

variable "availability_zone" {
  description = "AWS availability zone"
  type        = string
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
}

variable "allowed_ips" {
  description = "Allowed IPs"
  type        = list(string)
  default     = []
}


variable "public_subnet_cidr_block" {
  description = "CIDR block for the public subnet"
  type        = string
}