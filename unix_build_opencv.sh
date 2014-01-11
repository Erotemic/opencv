#!/bin/bash

cd ~/code/opencv
#rm -rf ~/code/opencv/build
mkdir ~/code/opencv/build
cd ~/code/opencv/build
#PYTHON_PACKAGES_PATH=$(python -c "import site; print(site.USER_SITE)" 2> /dev/null)

if [[ "$OSTYPE" == "darwin"* ]]; then
    # locate python libs
    # PYTHON_LIBRARY="/opt/local/lib/libpython2.7.dylib"
    # PYTHON_LIBRARY="/usr/lib/libpython2.7.dylib"
    MACPORTS_PYFRAMEWORK="/opt/local/Library/Frameworks/Python.framework/Versions/2.7"
    PYTHON_PACKAGES_PATH="$MACPORTS_PYFRAMEWORK/lib/python2.7/site-packages"
    PYTHON_LIBRARY="$MACPORTS_PYFRAMEWORK/lib/python2.7/config/libpython2.7.dylib"
    # OXS cmake command
    cmake -G "Unix Makefiles" \
        -D PYTHON_LIBRARY=$PYTHON_LIBRARY \
        -D CMAKE_BUILD_TYPE="Release"
        ~/code/opencv
        #-D CMAKE_OSX_ARCHITECTURES=x86_64 \
        #-D BUILD_PERF_TESTS=OFF \
else
    cmake -G "Unix Makefiles" \
        -D PYTHON_LIBRARY=$PYTHON_LIBRARY \
        -D CMAKE_BUILD_TYPE="Release"
         ~/code/opencv
fi

# Configure
# Build
make -j9
# Install
sudo make install

# Test if this worked
python -c "import cv2; print(cv2.__version__)"
