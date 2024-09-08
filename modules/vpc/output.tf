output "vpc_subnet_id" {
  value = aws_subnet.main_subnet.id
}

output "vm_sg_id" {
  value = aws_security_group.vm_sg.id
}

output "vpc_public_subnet_id" {
  value = aws_subnet.public_subnet.id
}