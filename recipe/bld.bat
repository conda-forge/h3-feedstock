mkdir build
cd build

set VERBOSE=1

cmake ^
      -D ENABLE_FORMAT=OFF ^
      -D BUILD_SHARED_LIBS=ON ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D CMAKE_BUILD_TYPE=Release ^
      -DCMAKE_SKIP_INSTALL_ALL_DEPENDENCY=ON ^
      .
if errorlevel 1 exit 1

cmake --build . --config Release
if errorlevel 1 exit 1

cmake --build . --config Release --target install
if errorlevel 1 exit 1
