#!/bin/bash
export username=${username}
export password=${password}

useradd -m $username
echo "$username:$password" | chpasswd

# Enable password authentication
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl restart sshd