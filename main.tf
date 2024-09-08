module "vpc" {
  source                   = "./modules/vpc"
  cidr_block               = var.cidr_block
  subnet_cidr_block        = var.subnet_cidr_block
  availability_zone        = var.availability_zone
  vpc_name                 = var.vpc_name
  allowed_ips              = var.allowed_ips
  public_subnet_cidr_block = var.public_subnet_cidr_block
}

resource "tls_private_key" "ec2_key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key_pair" {
  key_name   = var.aws_key_name
  public_key = tls_private_key.ec2_key_pair.public_key_openssh
}

resource "random_password" "user_password" {
  count   = var.vm_count
  length  = 16
  special = false
}

module "ec2" {
  source                      = "./modules/ec2"
  count                       = var.vm_count
  vm_flavor                   = var.vm_flavor[count.index]
  vm_image                    = var.vm_image[count.index]
  subnet_id                   = module.vpc.vpc_public_subnet_id
  security_group_id           = module.vpc.vm_sg_id
  vm_name                     = "${var.vm_prefix}-${count.index}"
  aws_key_name                = aws_key_pair.generated_key_pair.key_name
  associate_public_ip_address = true
  user_data_path              = file("${path.module}/scripts/create-user.sh")
  variable_data = {
    username = var.ec2_username
    password = "${random_password.user_password[count.index].result}"
  }
  depends_on = [module.vpc]
}
