mkdir build
cd build

set VERBOSE=1
set "CFLAGS= -g"
set VCINSTALLDIR="C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\"
set VS140COMNTOOLS="C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools\"
set VCTargetsPath=C:\Program Files (x86)\MSBuild\Microsoft.Cpp\v4.0\V140

set CMAKE_GENERATOR="Visual Studio 15 2017 Win64"

cmake -G %CMAKE_GENERATOR% ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D CMAKE_LIBRARY_PATH=%LIBRARY_LIB% ^
      %SRC_DIR%
if errorlevel 1 exit 1

cmake --build .
if errorlevel 1 exit 1

msbuild ALL_BUILD.vcxproj
msbuild RUN_TESTS.vcxproj
