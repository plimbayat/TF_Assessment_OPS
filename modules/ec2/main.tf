data "template_file" "user_data_server" {
  template = var.user_data_path
  vars     = var.variable_data
}

resource "aws_instance" "vm_instance" {
  ami                         = var.vm_image
  instance_type               = var.vm_flavor
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.aws_key_name
  tags = {
    Name = "${var.vm_name}"
  }
  user_data = data.template_file.user_data_server.rendered
}