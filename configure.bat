SET ORIGINAL=%CD%

call :build_opencv
goto :exit 

:build_opencv
:: helper variables
set INSTALL32=C:\Program Files (x86)
set OPENCV_INSTALL="%INSTALL32%\OpenCV"

cd %HOME%\code\opencv
mkdir %HOME%\code\opencv\build
cd %HOME%\code\opencv\build

:: OpenCV settings on windows
cmake -G "MSYS Makefiles" ^
-DCMAKE_INSTALL_PREFIX=%OPENCV_INSTALL% ^
-DCMAKE_C_FLAGS=-m32 ^
-DCMAKE_CXX_FLAGS=-m32 ^
-DENABLE_SSE=OFF ^
-DENABLE_SSE2=OFF ^
-DENABLE_SSE3=OFF ^
-DENABLE_SSE41=OFF ^
-DENABLE_SSE42=OFF ^
-DENABLE_SSEE3=OFF ^
-DINSTALL_PYTHON_EXAMPLES=ON ^
..
exit /b

:exit
cd %ORIGINAL%
exit /b
