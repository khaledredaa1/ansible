#!/bin/bash

# Update OS with the latest patches and install Python3
apt-get update -y
apt-get upgrade -y
apt-get install python3 -y

# Ensure passwordless sudo for the vagrant user
echo 'vagrant ALL=(ALL) NOPASSWD:ALL' | sudo tee /etc/sudoers.d/vagrant
