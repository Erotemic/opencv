cd ~/code/opencv
# rm -rf ~/code/opencv/build
mkdir ~/code/opencv/build
cd ~/code/opencv/build

if [[ "$OSTYPE" == "darwin"* ]]; then
    # IF OXS
    #Grab the correct site_packages on OSX
    PYTHON_PACKAGES_PATH="/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages"

    cmake -G "Unix Makefiles" \
        -D CMAKE_BUILD_TYPE=Release \
        -D BUILD_PERF_TESTS=OFF \
        -D PYTHON_PACKAGES_PATH=$PYTHON_PACKAGES_PATH \
        -D BUILD_opencv_legacy=YES \
    ~/code/opencv

    # Tried: 
    # PYTHON_LIBRARY="/opt/local/lib/libpython2.7.dylib"
    # PYTHON_LIBRARY="/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/config/libpython2.7.dylib"
    # -D PYTHON_LIBRARY=$PYTHON_LIBRARY \
    # -D CMAKE_OSX_ARCHITECTURES=x86_64
    # -D PYTHON_LIBRARY=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/libpython2.7.dylib 

else
    # IF LINUX
    PYTHON_PACKAGES_PATH=$(python -c "import site; print(site.USER_SITE)" 2> /dev/null)
    cmake -G "Unix Makefiles" -D PYTHON_PACKAGES_PATH=$PYTHON_PACKAGES_PATH -D BUILD_PERF_TESTS=OFF -D BUILD_opencv_legacy=NO ..
fi

make -j9
sudo make install
