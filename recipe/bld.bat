mkdir build
cd build

set "CXXFLAGS= -MD"
set

cmake -G "NMake Makefiles" ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D BUILD_SHARED_LIBS=TRUE ^
      -D BUILD_GENERATORS=TRUE ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D CMAKE_LIBRARY_PATH=%LIBRARY_LIB% ^
      ..
if errorlevel 1 exit 1

cmake --build . --config Release
if errorlevel 1 exit 1

cmake --build . --config Release --target install
if errorlevel 1 exit 1
