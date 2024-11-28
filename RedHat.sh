#!/bin/bash

# Update OS with the latest patches and install Python3
# yum update -y
 dnf install epel-release -y
 dnf install python3 -y

# Ensure passwordless sudo for the vagrant user (optional, but useful for automation)
echo 'vagrant ALL=(ALL) NOPASSWD:ALL' | sudo tee /etc/sudoers.d/vagrant
