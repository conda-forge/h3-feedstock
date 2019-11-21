mkdir build
cd build

set VERBOSE=1

cmake -G "NMake Makefiles" ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D CMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D CMAKE_LIBRARY_PATH=%LIBRARY_LIB% ^
      -D CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=FALSE ^
      -D BUILD_SHARED_LIBS=ON ^
      -D ENABLE_FORMAT=OFF ^
      %SRC_DIR%
      ..
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1
