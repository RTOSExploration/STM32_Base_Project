#!/usr/bin/env bash

DB=$RTOSExploration/bitcode-db/STM32_BASE
rm -rf $DB

rm -rf build
mkdir -p build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=../cross.cmake -DTARGET_GROUP=production
genbc $DB -c "make -j$(nproc)"
