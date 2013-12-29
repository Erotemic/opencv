#!/bin/bash

echo "Autobuilding OpenCV"


export OPENCV_SRC=~/code/opencv
export OPENCV_BUILD=$OPENCV_SRC/build

cd $OPENCV_SRC

if [ ! -d build ] ; then
    echo "Making Directory: $OPENCV_BUILD"
    mkdir $OPENCV_BUILD
fi
cd $OPENCV_BUILD

#if [ $name = "Hyrule"] then
echo "Configuring for platform="$platform
if [ $platform = "linux2" ] ; then
    export CV_SSE=ON
    export CV_SSE2=ON
    export CV_SSE3=ON
else
    export CV_SSE=OFF
    export CV_SSE2=OFF
    export CV_SSE3=OFF
fi

echo "Running cmake"

# flann is needed for features2d, even though we have our own
# SSE (Streaming SIMD Extensions) 
# SMID = (single instruction multiple data)

cmake -G "Unix Makefiles" ..


#cmake \
    #-G "Unix Makefiles"\
    #-DCMAKE_INSTALL_PREFIX='/usr/local'\
    #-DBUILD_opencv_gpu=OFF\
    #-DBUILD_opencv_gpuarithm=OFF\
    #-DBUILD_opencv_gpubgsegm=OFF\
    #-DBUILD_opencv_gpucodec=OFF\
    #-DBUILD_opencv_gpufeatures2d=OFF\
    #-DBUILD_opencv_gpufilters=OFF\
    #-DBUILD_opencv_gpuimgproc=OFF\
    #-DBUILD_opencv_gpuoptflow=OFF\
    #-DBUILD_opencv_gpustereo=OFF\
    #-DBUILD_opencv_gpuwarping=OFF\
    #-DENABLE_SSE=$CV_SSE\
    #-DENABLE_SSE2=$CV_SSE2\
    #-DENABLE_SSE3=$CV_SSE3\
    #..

    #-DBUILD_opencv_python=ON\
    #-DBUILD_opencv_core=ON\
    #-DBUILD_opencv_features2d=ON\
    #-DBUILD_opencv_highgui=ON\
    #-DBUILD_opencv_imgproc=ON\
    #-DBUILD_opencv_flann=ON\
    #-DBUILD_opencv_legacy=ON\
    #-DBUILD_opencv_ml=ON\
    #-DBUILD_opencv_nonfree=ON\
    #-DBUILD_opencv_calib3d=ON\
    #-DBUILD_opencv_contrib=ON\
    #-DBUILD_opencv_apps=Off\
    #-DBUILD_opencv_objdetect=OFF\
    #-DBUILD_opencv_photo=OFF\
    #-DBUILD_opencv_softcascade=OFF\
    #-DBUILD_opencv_stitching=OFF\
    #-DBUILD_opencv_superres=OFF\
    #-DBUILD_opencv_ts=OFF\
    #-DBUILD_opencv_video=OFF\
    #-DBUILD_opencv_videostab=OFF\
    #-DBUILD_opencv_world=OFF\
echo "Running make"

make -j9
#make -j9 opencv_features2d opencv_core opencv_highgui opencv_imgproc
#make -j9 opencv_python

echo "Running make install"
if [ $platform = "linux2" ] ; then
    if [ "$(id -u)" != "0" ]; then
        echo "You must be root to do make install."
        exit 1
    fi
fi 

make install 

echo "Running hotspotter localize"

#python ~/code/hotspotter/setup_localize.py opencv

#cd ~/code/hotspotter
