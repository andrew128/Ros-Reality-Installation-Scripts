#!/bin/bash

git clone https://github.com/OpenKinect/libfreenect2.git
cd libfreenect2

cd depends; ./download_debs_trusty.sh

sudo apt-get install build-essential cmake pkg-config

sudo dpkg -i debs/libusb*deb

sudo apt-get install libturbojpeg libjpeg-turbo8-dev

sudo dpkg -i debs/libglfw3*deb; sudo apt-get install -f

cd ..

mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=$HOME/freenect2
cmake .. -DENABLE_CXX11=ON
make
make install

sudo cp ../platform/linux/udev/90-kinect2.rules /etc/udev/rules.d/
