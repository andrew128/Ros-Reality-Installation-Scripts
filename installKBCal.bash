#!/bin/bash

sudo apt-get install ros-indigo-ar-track-alvar

cd catkin_ws/src
git clone https://github.com/ShibataLabPrivate/kinect_baxter_calibration.git
cd .. && catkin_make
./baxter.sh
