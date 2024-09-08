# Outputs for ping results
output "vm_name" {
  value = aws_instance.vm_instance.tags.Name
}

output "ec2_private_ip" {
  value = aws_instance.vm_instance.private_ip
}

output "ec2_public_ip" {
  value = aws_instance.vm_instance.public_ip
}