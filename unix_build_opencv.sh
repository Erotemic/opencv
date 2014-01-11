cd ~/code/opencv
rm -rf ~/code/opencv/build
mkdir ~/code/opencv/build
cd ~/code/opencv/build

# locate libpython

# Grab the correct site_packages
if [[ "$OSTYPE" == "darwin"* ]]; then
	PYTHON_PACKAGES_PATH="/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages"
	# PYTHON_LIBRARY="/opt/local/lib/libpython2.7.dylib"
	# PYTHON_LIBRARY="/usr/lib/libpython2.7.dylib"
	PYTHON_LIBRARY="/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/config/libpython2.7.dylib"
	# PYTHON_LIBRARY=""
	# PYTHON_LIBRARY=""
	# PYTHON_LIBRARY=""
	# PYTHON_LIBRARY=""

    cmake -G "Unix Makefiles" -D PYTHON_LIBRARY=$PYTHON_LIBRARY -D PYTHON_PACKAGES_PATH=$PYTHON_PACKAGES_PATH -D BUILD_PERF_TESTS=OFF -D CMAKE_OSX_ARCHITECTURES=x86_64 ..
    # -D PYTHON_LIBRARY=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/libpython2.7.dylib 
else
	PYTHON_PACKAGES_PATH=$(python -c "import site; print(site.USER_SITE)" 2> /dev/null)
    cmake -G "Unix Makefiles" \
        -D PYTHON_PACKAGES_PATH=$PYTHON_PACKAGES_PATH \
        -D BUILD_PERF_TESTS=OFF ..


    cmake \
        -D WITH_QT=ON
        -D INSTALL_PYTHON_EXAMPLES=ON
        -D BUILD_opencv_world=ON
fi

make -j9
sudo make install
