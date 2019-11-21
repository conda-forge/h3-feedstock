mkdir build
cd build

set VERBOSE=1

cmake -G "Visual Studio 14 Win64" ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D CMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D CMAKE_LIBRARY_PATH=%LIBRARY_LIB% ^
      -D CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=FALSE ^
      -D BUILD_SHARED_LIBS=ON ^
      -D ENABLE_FORMAT=OFF ^
      ..
if errorlevel 1 exit 1

cmake --build .
if errorlevel 1 exit 1

cmake --build . --target h3
if errorlevel 1 exit 1
