#!/bin/bash
cd ~/code/opencv
mkdir ~/code/opencv/build
cd ~/code/opencv/build
rm CMakeCache.txt

if [[ "$OSTYPE" == "darwin"* ]]; then
    # locate python libs
    export MACPORTS_PYFRAMEWORK=/opt/local/Library/Frameworks/Python.framework/Versions/2.7
    export PYTHON_LIBRARY="$MACPORTS_PYFRAMEWORK/lib/python2.7/config/libpython2.7.dylib"
    export PYTHON_PACKAGES_PATH="$MACPORTS_PYFRAMEWORK/lib/python2.7/site-packages"
    # OXS cmake command
    cmake -G "Unix Makefiles" \
        -D PYTHON_LIBRARY=$PYTHON_LIBRARY \
        -D PYTHON_PACKAGES_PATH=$PYTHON_PACKAGES_PATH
        -D CMAKE_BUILD_TYPE="Release" \
        -D INSTALL_PYTHON_EXAMPLES=ON \
        ~/code/opencv
else
    # Linux command
    cmake -G "Unix Makefiles" \
        -D PYTHON_LIBRARY=$PYTHON_LIBRARY \
        -D CMAKE_BUILD_TYPE="Release" \
        -D INSTALL_PYTHON_EXAMPLES=ON \
         ~/code/opencv
fi
