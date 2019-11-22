set BUILD_DIR=%SRC_DIR%\build

mkdir %BUILD_DIR%
cd %BUILD_DIR%

echo "%SRC_DIR%"

set CMAKE_GENERATOR="NMake Makefiles"
cmake -G %CMAKE_GENERATOR% ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D CMAKE_LIBRARY_PATH=%LIBRARY_LIB% ^
      -D CMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      ..
if errorlevel 1 exit 1

cmake --build .
if errorlevel 1 exit 1

cmake --build . --target install
if errorlevel 1 exit 1

ls -LR

cmake --build . --target all_build
if errorlevel 1 exit 1

@if not defined _echo echo off
for /f "usebackq delims=" %%i in (`vswhere.exe -prerelease -latest -property installationPath`) do (
  if exist "%%i\Common7\Tools\vsdevcmd.bat" (
    %comspec% /k "%%i\Common7\Tools\vsdevcmd.bat" %*
    exit /b
  )
)

rem Instance or command prompt not found
exit /b 2

msbuild ALL_BUILD.vcxproj
msbuild RUN_TESTS.vcxproj
