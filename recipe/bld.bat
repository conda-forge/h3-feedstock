mkdir build
cd build

cmake -G "NMake Makefiles" ^
      -DcMAKE_BUILD_TYPE=Release ^
      -DBUILD_SHARED_LIBS:BOOL=ON ^
      -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -DCMAKE_LIBRARY_PATH=%LIBRARY_LIB% ^
      -DCMAKE_INSTALL_PREFIX:PATH=%LIBRARY_PREFIX% ^
      -DUSE_BLAS:BOOL=OFF ^
      ..
if errorlevel 1 exit 1

cmake --build .
if errorlevel 1 exit 1

cmake --build . --target install
if errorlevel 1 exit 1
