mkdir build-shared
cd build-shared

cmake -G "NMake Makefiles" ^
      %COMPILER% ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D CMAKE_LIBRARY_PATH=%LIBRARY_LIB% ^
      -D CMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -D CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=TRUE ^
      -D BUILD_SHARED_LIBS=TRUE ^
      ..
if errorlevel 1 exit 1

cmake --build .
if errorlevel 1 exit 1

cmake --build . --target install
if errorlevel 1 exit 1
