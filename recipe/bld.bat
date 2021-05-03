mkdir build
cd build

set "CFLAGS= -LD"
set "CXXFLAGS= -LD"

cmake -G "NMake Makefiles" ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D BUILD_SHARED_LIBS=TRUE ^
      -D BUILD_GENERATORS=TRUE ^
      -D BUILD_TESTING=OFF ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      ..
if errorlevel 1 exit 1
