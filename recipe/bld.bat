mkdir build
cd build

set "CFLAGS= -LD"
set "CXXFLAGS= -LD"

cmake ..
if errorlevel 1 exit 1