mkdir build
cd build

set VERBOSE=1
set VCINSTALLDIR="C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\"
set VS140COMNTOOLS="C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools\"
set CMAKE_GENERATOR="Visual Studio 15 2017 Win64"

cmake -G %CMAKE_GENERATOR% ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D CMAKE_LIBRARY_PATH=%LIBRARY_LIB% ^
      -D BUILD_SHARED_LIBS:BOOL=ON ^
      %SRC_DIR%
if errorlevel 1 exit 1

cmake --build .
if errorlevel 1 exit 1
