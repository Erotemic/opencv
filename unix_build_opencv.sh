#!/bin/bash

cd ~/code/opencv
#rm -rf ~/code/opencv/build
#PYTHON_PACKAGES_PATH=$(python -c "import site; print(site.USER_SITE)" 2> /dev/null)

# Configure
source unix_cmake_configure.sh
cd ~/code/opencv/build
# Build
make -j9
# Install
sudo make install

# Test if this worked
python -c "import cv2; print(cv2.__version__)"
