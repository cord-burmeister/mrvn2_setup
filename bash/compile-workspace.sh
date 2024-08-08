#!/bin/bash

# bash won't source .bashrc from an interactive terminal unless I manually run bash from a terminal:
# $ bash
# or manually source it:
source /home/vagrant/.bashrc

workspacename=master3_ws

cd /home/vagrant/$workspacename
colcon build

source /home/vagrant/$workspacename/install/setup.bash




