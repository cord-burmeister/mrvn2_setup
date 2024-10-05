#!/bin/bash

# bash won't source .bashrc from an interactive terminal unless I manually run bash from a terminal:
# $ bash
# or manually source it:
source /home/$USER/.bashrc

workspacename=master3_ws

cd /home/$USER/$workspacename
colcon build
source /home/$USER/$workspacename/install/setup.bash
colcon build




