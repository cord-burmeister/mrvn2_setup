!#/bin/bash

workspacename=master3_ws
rosdistribution=humble

mkdir -p ~/$workspacename/src
cd ~/$workspacename/src

# Make a sub folder for every component, here the yahboom rosmaster3 
git clone https://cord.visualstudio.com/DefaultCollection/rosmaster%20x3/_git/yahboomcar

# Make a sub folder for every component, here master3 
git clone https://cord.visualstudio.com/DefaultCollection/rosmaster%20x3/_git/master3

# Before building the workspace, you need to resolve the package dependencies. 
# You may have all the dependencies already, but best practice is to check for 
# dependencies every time you clone. You wouldn’t want a build to fail after 
# a long wait only to realize that you have missing dependencies.

cd ~/$workspacename
sudo rosdep init    
rosdep install -i --from-path src --rosdistro $rosdistribution -y

cd ~/$workspacename
colcon build

source install/local_setup.bash

