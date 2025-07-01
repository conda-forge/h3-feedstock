mkdir build
cd build

set "CFLAGS= -LD"
set "CXXFLAGS= -LD"

cmake -G "NMake Makefiles" ^
      %CMAKE_ARGS% ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D BUILD_SHARED_LIBS=TRUE ^
      -D BUILD_GENERATORS=FALSE ^
      -D ENABLE_COVERAGE=FALSE ^
      -D BUILD_BENCHMARKS=FALSE ^
      -D BUILD_FILTERS=TRUE ^
      -D WARNINGS_AS_ERRORS=FALSE ^
      -D ENABLE_LINTING=FALSE ^
      -D ENABLE_DOCS=FALSE ^
      -D BUILD_TESTING=FALSE ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      ..
if errorlevel 1 exit 1

cmake --build .
if errorlevel 1 exit 1

cmake --build . --target install
if errorlevel 1 exit 1
