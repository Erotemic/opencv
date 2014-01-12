SET ORIGINAL=%CD%

cd %HOME%\code\opencv
:: first do configure
call mingw_opencv_configure.bat
:: then do build
call :build_opencv
goto :exit 

:: Define build procedure
:build_opencv
:: make
:: make command that doesn't freeze on mingw
mingw32-make -j7 "MAKE=mingw32-make -j3" -f CMakeFiles\Makefile2 all
make install
exit /b

:exit
cd %ORIGINAL%
exit /b
