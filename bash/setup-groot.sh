#!/bin/bash

# bash won't source .bashrc from an interactive terminal unless I manually run bash from a terminal:
# $ bash
# or manually source it:
source /home/vagrant/.bashrc

workspacename=groot_ws


# First install required development tools
# run the following commands to install the necessary 
# dependencies:
sudo apt-get update
sudo apt-get install -y libzmq3-dev libboost-dev libboost-system-dev libboost-filesystem-dev libboost-thread-dev libprotobuf-dev protobuf-compiler libmsgsl-dev libgtest-dev cmake -y


# Then create a new workspace and load the git repositories which are required.
mkdir -p /home/vagrant/$workspacename/src
cd /home/vagrant/$workspacename/src

# Build and install BehaviorTree.CPP:
# Clone the BehaviorTree.CPP repository, build, and install the library:
git clone https://github.com/BehaviorTree/BehaviorTree.CPP.git
cd BehaviorTree.CPP
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install



