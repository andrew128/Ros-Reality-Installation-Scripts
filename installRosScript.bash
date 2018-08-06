#!/bin/bash

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'

wget http://packages.ros.org/ros.key -O - | sudo apt-key add -

sudo apt-get update

sudo apt-get install ros-indigo-desktop-full

sudo rosdep init

rosdep update

sudo apt-get install python-rosinstall

mkdir -p ~/catkin_ws/src

source /opt/ros/indigo/setup.bash
echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
source ~/.bashrc

cd ~/catkin_ws
catkin_make
catkin_make install

sudo apt-get update
sudo apt-get install git-core python-argparse python-wstool python-vcstools python-rosdep ros-indigo-control-msgs ros-indigo-joystick-drivers

cd ~/catkin_ws/src
wstool init .
wstool merge https://raw.githubusercontent.com/RethinkRobotics/baxter/master/baxter_sdk.rosinstall
wstool update

source /opt/ros/indigo/setup.bash

cd ~/catkin_ws
catkin_make
catkin_make install

wget https://github.com/RethinkRobotics/baxter/raw/master/baxter.sh
chmod u+x baxter.sh

source devel/setup.bash

echo $ROS_PACKAGE_PATH

# ENABLE ROBOT
rosrun baxter_tools  enable_robot.py -s

