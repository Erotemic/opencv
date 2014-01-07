cd ~/code/opencv
mkdir ~/code/opencv/build
cd ~/code/opencv/build

cmake -G "Unix Makefiles" -D BUILD_PERF_TESTS=OFF -D BUILD_opencv_legacy=NO ..
make -j9
sudo make install
