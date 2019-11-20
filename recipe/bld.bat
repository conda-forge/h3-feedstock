mkdir build-shared
cd build-shared

cmake -G "NMake Makefiles" ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_LIBRARY_PATH=%LIBRARY_LIB% ^
      -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -Dh3_WITH_ZLIB=ON ^
      -Dh3_BUILD_SHARED_LIBS=ON ^
      -Dh3_MSVC_STATIC_RUNTIME=OFF ^
      ..
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake check
if errorlevel 1 exit 1
