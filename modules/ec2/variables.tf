variable "vm_flavor" {
  description = "Instance type for the VMs"
  type        = string
}

variable "vm_image" {
  description = "AMI ID for the VMs"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID where the VMs will reside"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for the VMs"
  type        = string
}

variable "vm_name" {
  description = "Name for VMs"
  type        = string
}

variable "user_data_path" {
  type        = string
  description = "User data to provide when launching the instance."
}

variable "variable_data" {
  type        = map(string)
  description = "User data variable to be passed to user data template file"
  default     = {}
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Associate public IP Address"
  default     = false
}

variable "aws_key_name" {
  type        = string
  description = "AWS Key pair"
  default     = null
}
