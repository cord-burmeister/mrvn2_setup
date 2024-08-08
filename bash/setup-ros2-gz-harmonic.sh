#!/bin/bash

sudo apt-get update
sudo apt-get install lsb-release wget gnupg
curl https://packages.osrfoundation.org/gazebo.gpg --output /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install gz-harmonic -y

 # Add sourcing to your shell startup script
echo "export GZ_VERSION=harmonic" >> /home/vagrant/.bashrc