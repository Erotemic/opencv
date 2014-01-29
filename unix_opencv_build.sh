#!/bin/bash

cd ~/code/opencv
#rm -rf ~/code/opencv/build
#PYTHON_PACKAGES_PATH=$(python -c "import site; print(site.USER_SITE)" 2> /dev/null)

# Configure
source unix_opencv_configure.sh
cd ~/code/opencv/build

echo "Finished Configure"

# Build and install if succesfull
make -j9 && sudo make install

echo "Finished Build"

# Test if this worked
python -c "import cv2; print(cv2.__version__)"
