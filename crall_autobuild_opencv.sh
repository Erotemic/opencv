#/bin/bash
cd ~/code/opencv
cd build
make -j9
cd ~/code/hotspotter
python setup_localize.py opencv
cd ~/code/hotspotter
