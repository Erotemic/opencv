#!/bin/bash

#cd ~/code/opencv
#rm -rf ~/code/opencv/build
mkdir build
#cd build
#PYTHON_PACKAGES_PATH=$(python -c "import site; print(site.USER_SITE)" 2> /dev/null)

if [[ "$OSTYPE" == "darwin"* ]]; then
    # locate python libs
    PYTHON_LIBRARY="/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/
config/libpython2.7.dylib"
    #PYTHON_PACKAGES_PATH="/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages"
    # PYTHON_LIBRARY="/opt/local/lib/libpython2.7.dylib"
    # PYTHON_LIBRARY="/usr/lib/libpython2.7.dylib"
     #-D BUILD_PERF_TESTS=OFF \

    # OXS cmake command
    export OPENCV_OS_CMAKE_OPTIONS=
        -D CMAKE_OSX_ARCHITECTURES=x86_64 \
        -D PYTHON_LIBRARY=$PYTHON_LIBRARY
else
    #cmake -G "Unix Makefiles" \
        #-D PYTHON_PACKAGES_PATH=$PYTHON_PACKAGES_PATH \
        #-D BUILD_PERF_TESTS=OFF ..
        #-D WITH_QT=ON \
        #-D BUILD_opencv_world=ON \

    export OPENCV_CMAKE_OPTIONS=-D INSTALL_PYTHON_EXAMPLES=ON
fi

# Configure
cmake -G "Unix Makefiles" $OPENCV_OS_CMAKE_OPTIONS ./build
# Build
make -j9
# Install
sudo make install
