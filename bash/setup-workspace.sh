#!/bin/bash

# bash won't source .bashrc from an interactive terminal unless I manually run bash from a terminal:
# $ bash
# or manually source it:
source /home/vagrant/.bashrc

workspacename=master3_ws

# First install required development tools
sudo apt install python3-vcstool python3-colcon-common-extensions git wget -y
sudo apt install libgflags-dev -y

# Then create a new workspace and load the git repositories which are required.
mkdir -p /home/vagrant/$workspacename/src
cd /home/vagrant/$workspacename/src

wget https://raw.githubusercontent.com/cord-burmeister/master3_nav/main/master3_nav.yaml
vcs import < master3_nav.yaml


# Before building the workspace, you need to resolve the package dependencies. 
# You may have all the dependencies already, but best practice is to check for 
# dependencies every time you clone. You wouldn’t want a build to fail after 
# a long wait only to realize that you have missing dependencies.

cd /home/vagrant/$workspacename
sudo rosdep init
rosdep update    
echo rosdep install -r -y --from-path src --rosdistro $ROS_DISTRO 
rosdep install -r -y --from-path src --rosdistro humble

# cd /home/vagrant/$workspacename
# colcon build


# source /home/vagrant/$workspacename/install/setup.bash

 # Add sourcing to your shell startup script
echo "source /home/vagrant/$workspacename/install/setup.bash" >> /home/vagrant/.bashrc
echo "cd /home/vagrant/$workspacename" >> /home/vagrant/.bashrc



