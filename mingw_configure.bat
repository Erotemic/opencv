SET ORIGINAL=%CD%
:: helper variables
set INSTALL32=C:\Program Files (x86)
set OPENCV_INSTALL="%INSTALL32%\OpenCV"

call :configure_opencv
goto :exit 

:: Define mingw configure procedure
:configure_opencv
cd %HOME%\code\opencv
mkdir %HOME%\code\opencv\build
cd build

:: OpenCV settings on windows
cmake -G "MSYS Makefiles" ^
-DCMAKE_BUILD_TYPE="Release" ^
-DINSTALL_PYTHON_EXAMPLES=ON ^
-DCMAKE_INSTALL_PREFIX=%OPENCV_INSTALL% ^
-DCMAKE_C_FLAGS=-m32 ^
-DCMAKE_CXX_FLAGS=-m32 ^
-DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-O2 -g -DNDEBUGS" ^
-DCMAKE_C_FLAGS_RELWITHDEBINFO="-O2 -g -DNDEBUGS" ^
-DCMAKE_CXX_FLAGS_RELEASE="-O2 -DNDEBUGS" ^
-DCMAKE_C_FLAGS_RELEASE="-O2 -DNDEBUGS" ^
..
:: -DENABLE_SSE=OFF ^
:: -DENABLE_SSE2=OFF ^
:: -DENABLE_SSE3=OFF ^
:: -DENABLE_SSE41=OFF ^
:: -DENABLE_SSE42=OFF ^
:: -DENABLE_SSEE3=OFF ^
:: -DBUILD_opencv_world=ON ^
:: -DWITH_QT=ON ^
exit /b

:exit
cd %ORIGINAL%
exit /b
