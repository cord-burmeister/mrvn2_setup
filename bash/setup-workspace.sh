!#/bin/bash

workspacename=x2_ws
rosdistribution=humble

mkdir -p ~/$workspacename/src
cd ~/$workspacename/src

# Make a sub folder for every 
mkdir -p ~/$workspacename/src/ros_tutorials
git clone https://github.com/ros/ros_tutorials.git -b $rosdistribution


# Before building the workspace, you need to resolve the package dependencies. 
# You may have all the dependencies already, but best practice is to check for 
# dependencies every time you clone. You wouldn’t want a build to fail after 
# a long wait only to realize that you have missing dependencies.

cd ~/$workspacename
rosdep install -i --from-path src --rosdistro $rosdistribution -y


cd ~/$workspacename
colcon build

source install/local_setup.bash


echo ros2 run turtlesim turtlesim_node