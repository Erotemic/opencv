#!/bin/bash

# FIXME: relative path
cd ~/code/opencv
#rm -rf ~/code/opencv/build
#PYTHON_PACKAGES_PATH=$(python -c "import site; print(site.USER_SITE)" 2> /dev/null)

# Configure
source unix_configure.sh
cd ~/code/opencv/build

echo "Finished Configure"

export NCPUS=$(grep -c ^processor /proc/cpuinfo)

# Build and install if succesfull
echo "Running: make -j$NCPUS"
make -j$NCPUS || { echo "FAILED MAKE" ; exit 1; }
echo "Running: sudo make install"
sudo make install || { echo "FAILED MAKE INSTALL" ; exit 1; }
echo "Finished Build"

# Test if this worked
python2.7 -c "import cv2; print(cv2.__version__)"
