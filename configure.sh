#!/bin/bash
cd ~/code/opencv
mkdir ~/code/opencv/build
cd ~/code/opencv/build
rm CMakeCache.txt

if [[ "$OSTYPE" == "darwin"* ]]; then
    # locate python libs
    MACPORTS_PYFRAMEWORK="/opt/local/Library/Frameworks/Python.framework/Versions/2.7"
    PYTHON_PACKAGES_PATH="$MACPORTS_PYFRAMEWORK/lib/python2.7/site-packages"
    # OXS cmake command
    cmake -G "Unix Makefiles" \
        -D PYTHON_LIBRARY=$PYTHON_LIBRARY \
        -D CMAKE_BUILD_TYPE="Release" \
        ~/code/opencv
else
    # Linux command
    cmake -G "Unix Makefiles" \
        -D PYTHON_LIBRARY=$PYTHON_LIBRARY \
        -D CMAKE_BUILD_TYPE="Release" \
         ~/code/opencv
fi
