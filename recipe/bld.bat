mkdir build
cd build

set CMAKE_GENERATOR="NMake Makefiles"
cmake -G %CMAKE_GENERATOR% ^
      %COMPILER% ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=FALSE
      -DBUILD_SHARED_LIBS:BOOL=ON ^
      -DCMAKE_LIBRARY_PATH=%LIBRARY_LIB% ^
      -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
      -DBUILD_SHARED_LIBS:BOOL=ON ^
      .
if errorlevel 1 exit 1

cmake --build .
if errorlevel 1 exit 1

cmake --build . --target install
if errorlevel 1 exit 1
