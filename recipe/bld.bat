set BUILD_DIR=%SRC_DIR%\build

mkdir %BUILD_DIR%
cd %BUILD_DIR%

echo "%SRC_DIR%"

#set CMAKE_GENERATOR="NMake Makefiles"
set CMAKE_GENERATOR="Visual Studio 15 2017 Win64" ..
cmake -G %CMAKE_GENERATOR% ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D CMAKE_LIBRARY_PATH=%LIBRARY_LIB% ^
      -D CMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -D BUILD_SHARED_LIBS:BOOL=ON ^
      ..
if errorlevel 1 exit 1

cmake --build .
if errorlevel 1 exit 1

cmake --build . --target install
if errorlevel 1 exit 1

#msbuild ALL_BUILD.vcxproj
#msbuild RUN_TESTS.vcxproj
