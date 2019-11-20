mkdir build
cd build

cmake -G "NMake Makefiles" ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D CMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D CMAKE_LIBRARY_PATH=%LIBRARY_LIB% ^
      -D CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=FALSE ^
      -D BUILD_SHARED_LIBS:BOOL=ON ^
      -D MSVC_STATIC_RUNTIME=OFF ^
      ..
if errorlevel 1 exit 1

cmake --build .
if errorlevel 1 exit 1

cmake --build . --target install
if errorlevel 1 exit 1
