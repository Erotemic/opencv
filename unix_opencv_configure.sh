#!/bin/bash
cd ~/code/opencv
mkdir ~/code/opencv/build
cd ~/code/opencv/build
rm CMakeCache.txt


uninstall_opencv()
{
    rm -rf /usr/local/bin/opencv*
    rm -rf /usr/local/include/opencv
    rm -rf /usr/local/include/opencv2
    rm -rf /usr/local/lib/libopencv*
    rm -rf /usr/local/lib/pkgconfig/opencv.pc
    rm -rf /opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/cv2.so
    rm -rf /opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/cv2.pyd
}

if [[ "$OSTYPE" == "darwin"* ]]; then
    # locate python libs
    export MACPORTS_PYFRAMEWORK=/opt/local/Library/Frameworks/Python.framework/Versions/2.7
    export PYTHON_LIBRARY="$MACPORTS_PYFRAMEWORK/lib/python2.7/config/libpython2.7.dylib"
    export PYTHON_PACKAGES_PATH="$MACPORTS_PYFRAMEWORK/lib/python2.7/site-packages"
    # OXS cmake command
    # Need to have port install libpng
    cmake -G "Unix Makefiles" \
        -D PYTHON_LIBRARY=$PYTHON_LIBRARY \
        -D PYTHON_PACKAGES_PATH=$PYTHON_PACKAGES_PATH \
        -D CMAKE_BUILD_TYPE="Release" \
        -D INSTALL_PYTHON_EXAMPLES=ON \
        -D BUILD_PNG=OFF \
        -D BUILD_OPENEXR=OFF \
        -D BUILD_JPEG=OFF \
        -D BUILD_JASPER=OFF \
        -D BUILD_ZLIB=OFF \
        -D OPENCV_WARNINGS_ARE_ERRORS=OFF \

        ~/code/opencv
else
    # Linux command
    cmake -G "Unix Makefiles" \
        -D CMAKE_BUILD_TYPE="Release" \
        -D INSTALL_PYTHON_EXAMPLES=ON \
         ~/code/opencv
fi


#sudo port install zlib
#sudo port install jasper
#sudo port install libpng
#sudo port install openexr

# OLD MAC BUILD

    # locate python libs
    #export MACPORTS_PYFRAMEWORK=/opt/local/Library/Frameworks/Python.framework/Versions/2.7
    #export PYTHON_LIBRARY="$MACPORTS_PYFRAMEWORK/lib/python2.7/config/libpython2.7.dylib"
    #export PYTHON_PACKAGES_PATH="$MACPORTS_PYFRAMEWORK/lib/python2.7/site-packages"
    # OXS cmake command
    #cmake -G "Unix Makefiles" \
        #-D PYTHON_LIBRARY=$PYTHON_LIBRARY \
        #-D PYTHON_PACKAGES_PATH=$PYTHON_PACKAGES_PATH \
        #-D CMAKE_BUILD_TYPE="Release" \
        #-D INSTALL_PYTHON_EXAMPLES=ON \
        #~/code/opencv

