mkdir build
cd build

14.16.27012

set VERBOSE=1
set "CFLAGS= -g"
set VCIDEInstallDir=C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\IDE\VC\
set VS150COMNTOOLS=C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\Tools\
set VCINSTALLDIR=C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\IDE\VC\
set VCTargetsPath=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\IDE\VC\VCTargets\
set VCTargetsPath15=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\IDE\VC\VCTargets\
set VCToolsInstallDir=C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\VC\Tools\MSVC\14.16.27012\
set VCToolsRedistDir=C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\VC\Redist\MSVC\14.16.27012\

set CMAKE_GENERATOR="Visual Studio 15 2017 Win64"

cmake -G %CMAKE_GENERATOR% ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D CMAKE_LIBRARY_PATH=%LIBRARY_LIB% ^
      %SRC_DIR%
if errorlevel 1 exit 1

cmake --build .
if errorlevel 1 exit 1

msbuild ALL_BUILD.vcxproj
msbuild RUN_TESTS.vcxproj
