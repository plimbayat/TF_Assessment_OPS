output "ping_results" {
  value = data.local_file.file_content.content
}

locals {
  ec2_passwords = {
    for i in range(var.vm_count) : "${var.vm_prefix}-${i}" => random_password.user_password[i].result
  }
}

output "ec2_passwords" {
  value     = local.ec2_passwords
  sensitive = true
}