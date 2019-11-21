set BUILD_DIR=%SRC_DIR%\build

mkdir %BUILD_DIR%
cd %BUILD_DIR%

echo "%SRC_DIR%"

set CMAKE_GENERATOR="NMake Makefiles"
cmake -G %CMAKE_GENERATOR% ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DBUILD_SHARED_LIBS:BOOL=ON ^
      -DCMAKE_LIBRARY_PATH=%LIBRARY_LIB% ^
      -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
if errorlevel 1 exit 1

cmake --build .
if errorlevel 1 exit 1

cmake --build . --target install
if errorlevel 1 exit 1

msbuild ALL_BUILD.vcxproj
msbuild RUN_TESTS.vcxproj
