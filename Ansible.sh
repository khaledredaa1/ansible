#!/bin/bash

# Install EPEL repository, Ansible, and Python
# yum update -y
dnf install epel-release -y
dnf install ansible -y
dnf install python3 -y

# Configure Ansible settings
bash -c 'cat <<EOF > /etc/ansible/ansible.cfg
[defaults]
remote_port       = 22
remote_user       = vagrant
host_key_checking = False
roles_path        = /home/vagrant/vproject

[privilege_escalation]
become          = True
become_method   = sudo
become_user     = root
become_ask_pass = False

EOF'

# Create Ansible hosts file
bash -c 'cat <<EOF > /etc/ansible/hosts
 [vprofile]
   db01
   mc01
   rmq01
   app01
   web01
 [mariadb]
   db01
 [memcache]
   mc01
 [rabbitmq]
   rmq01
 [tomcat]
   app01
 [nginx]
   web01
 [monitor]
   monitor01
EOF'

# Ensure passwordless sudo for the vagrant user
echo 'vagrant ALL=(ALL) NOPASSWD:ALL' | sudo tee /etc/sudoers.d/vagrant
