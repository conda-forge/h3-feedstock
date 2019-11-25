mkdir build
cd build

set VERBOSE=1
set "CFLAGS= -g"


VCIDEInstallDir = C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\
VCINSTALLDIR = C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\
VCTargetsPath = C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\Common7\IDE\VC\VCTargets\
VCTargetsPath10 = C:\Program Files (x86)\MSBuild\Microsoft.Cpp\v4.0\
VCTargetsPath11 = C:\Program Files (x86)\MSBuild\Microsoft.Cpp\v4.0\V110\
VCTargetsPath12 = C:\Program Files (x86)\MSBuild\Microsoft.Cpp\v4.0\V120\
VCTargetsPath14 = C:\Program Files (x86)\MSBuild\Microsoft.Cpp\v4.0\V140\
VCToolsInstallDir = C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\
VCToolsRedistDir = C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\Redist\

set CMAKE_GENERATOR="Visual Studio 14 2015 Win64"

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
