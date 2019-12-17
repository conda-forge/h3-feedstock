mkdir build
cd build

set VERBOSE=1
set "CFLAGS= -g"


set VCIDEInstallDir = C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\
set VCINSTALLDIR = C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\
set VCTargetsPath = C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\Common7\IDE\VC\VCTargets\
set VCTargetsPath10 = C:\Program Files (x86)\MSBuild\Microsoft.Cpp\v4.0\
set VCTargetsPath11 = C:\Program Files (x86)\MSBuild\Microsoft.Cpp\v4.0\V110\
set VCTargetsPath12 = C:\Program Files (x86)\MSBuild\Microsoft.Cpp\v4.0\V120\
set VCTargetsPath14 = C:\Program Files (x86)\MSBuild\Microsoft.Cpp\v4.0\V140\
set VCToolsInstallDir = C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\
set VCToolsRedistDir = C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\Redist\
set VS140COMNTOOLS = C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools\
set CMAKE_GENERATOR="Ninja"
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /INCREMENTAL:NO" )


cmake -G %CMAKE_GENERATOR% ^
      -D CMAKE_C_COMPILER="cl.exe" ^
      -D CMAKE_VERBOSE_MAKEFILE:BOOL=ON ^
      -D CMAKE_CXX_COMPILER="cl.exe" ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D BUILD_SHARED_LIBS:BOOL=ON ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D CMAKE_LIBRARY_PATH=%LIBRARY_LIB% ^
      %SRC_DIR%
if errorlevel 1 exit 1

:: Build.
cmake --build . --config Release
if errorlevel 1 exit 1

:: Install.
cmake --build . --config Release --target install
if errorlevel 1 exit 1
