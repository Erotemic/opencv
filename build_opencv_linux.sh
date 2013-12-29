export SRC_DIR=$code/opencv
export BUILD_DIR=$SRC_DIR/build

cd $SRC_DIR
mkdir $BUILD_DIR
cd $BUILD_DIR
cmake $SRC_DIR
make -j9

#make install
