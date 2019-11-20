mkdir build
cd build

cmake -G %CMAKE_GENERATOR% ^
      -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
      %COMPILER% ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DBUILD_SHARED_LIBS:BOOL=ON ^
      -DCMAKE_LIBRARY_PATH=%LIBRARY_LIB% ^
      -DBUILD_SHARED_LIBS:BOOL=ON ^
      ..
if errorlevel 1 exit 1

cmake --build .
if errorlevel 1 exit 1

cmake --build . --target install
if errorlevel 1 exit 1
