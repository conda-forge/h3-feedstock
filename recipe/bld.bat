mkdir build
cd build

set "CFLAGS= -LD"
set "CXXFLAGS= -LD"

cmake -G "NMake Makefiles" ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D BUILD_SHARED_LIBS=TRUE ^
      -D BUILD_GENERATORS=TRUE ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      ..
if errorlevel 1 exit 1

cmake --build .
if errorlevel 1 exit 1

cmake --build . --target install
if errorlevel 1 exit 1

:: Move the .dll file to the Library\lib folder.
move %LIBRARY_BIN%\h3.dll %LIBRARY_LIB%\h3.dll