resource "local_sensitive_file" "key_file" {
  filename        = "${path.module}/key.pem"
  content         = tls_private_key.ec2_key_pair.private_key_pem
  file_permission = "0400"
}

resource "local_file" "final_output" {
  filename = "${path.module}/final_output.txt"
  content  = ""
}

resource "null_resource" "ping_results" {
  count = var.vm_count
  triggers = {
    key = "${timestamp()}"
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = tls_private_key.ec2_key_pair.private_key_pem
    host        = module.ec2[count.index].ec2_public_ip
  }
  provisioner "file" {
    source      = "${path.module}/scripts/ping-check.sh"
    destination = "/tmp/ping-check.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/ping-check.sh",
      "/tmp/ping-check.sh ${module.ec2[count.index].vm_name} ${module.ec2[(count.index + 1) % var.vm_count].vm_name} ${module.ec2[(count.index + 1) % var.vm_count].ec2_private_ip}"
    ]
  }
  depends_on = [module.ec2]
}

resource "null_resource" "fetch_ping_results" {
  count = var.vm_count
  triggers = {
    key = "${timestamp()}"
  }
  provisioner "local-exec" {
    #command = "scp -o StrictHostKeyChecking=no -i ${path.module}/key.pem ec2-user@${module.ec2[count.index].ec2_public_ip}:/tmp/ping_result-${count.index}.txt ${path.module}; sleep $((5+${count.index})); cat ${path.module}/ping_result-${count.index}.txt >> ${path.module}/final_output.txt"
    command = "scp -o StrictHostKeyChecking=no -i ${path.module}\\key.pem ec2-user@${module.ec2[count.index].ec2_public_ip}:/tmp/ping_result-${count.index}.txt ${path.module}; Get-Content ${path.module}\\ping_result-${count.index}.txt | Add-Content ${path.module}\\final_output.txt; Remove-Item ${path.module}\\ping_result-${count.index}.txt"
    interpreter = ["PowerShell", "-Command"]
  }
  depends_on = [null_resource.ping_results]
}

# Output the content of the file
data "local_file" "file_content" {
  filename   = "${path.module}/final_output.txt"
  depends_on = [null_resource.fetch_ping_results]
}
