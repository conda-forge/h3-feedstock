#!/usr/bin/env bash

set -ex

cmake ${CMAKE_ARGS} \
  -DENABLE_FORMAT=OFF \
  -DBUILD_SHARED_LIBS=ON \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_SKIP_INSTALL_ALL_DEPENDENCY=ON \
  .

make -k -j${CPU_COUNT} || true

make install

if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
make test
fi
