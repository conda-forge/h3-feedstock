mkdir build
cd build

14.16.27012

set VERBOSE=1
set "CFLAGS= -g"

set CMAKE_GENERATOR="Visual Studio 14 2015 Win64"
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
