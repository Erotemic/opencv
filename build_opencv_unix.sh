cd ~/code/opencv
mkdir ~/code/opencv/build
cd ~/code/opencv/build

# Grab the correct site_packages
PYTHON_PACKAGES_PATH=$(python -c "import site; print(site.USER_SITE)" 2> /dev/null)

cmake -G "Unix Makefiles" -D PYTHON_PACKAGES_PATH=$PYTHON_PACKAGES_PATH -D BUILD_PERF_TESTS=OFF -D BUILD_opencv_legacy=NO ..

make -j9
sudo make install
