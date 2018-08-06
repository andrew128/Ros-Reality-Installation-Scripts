#!/bin/bash

# RUN IN USER DIR
# -----------
./baxter.sh
# -----------
cd ~/catkin_ws/src/
git clone https://github.com/code-iai/iai_kinect2.git
cd iai_kinect2
rosdep install -r --from-paths .
cd ~/catkin_ws
catkin_make -DCMAKE_BUILD_TYPE="Release"

# CONNECT SENSOR
#roslaunch kinect2_bridge kinect2_bridge.launch

