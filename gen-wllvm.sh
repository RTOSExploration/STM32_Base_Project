#!/usr/bin/env bash

#DB=$RTOSExploration/bitcode-db/STM32_BASE
#rm -rf $DB

export LLVM_COMPILER=hybrid
export LLVM_COMPILER_PATH=/usr/lib/llvm-14/bin
export GCC_PATH="$RTOSExploration/toolchain/gcc-arm-none-eabi-10.3-2021.10/bin/"
export GCC_CROSS_COMPILE_PREFIX=arm-none-eabi-
export PATH=$RTOSExploration/bin-wrapper:$PATH
rm -rf build
cmake -Bbuild -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=cross.cmake -DTARGET_GROUP=production
cmake --build build -j$(nproc)
extract-bc build/main.elf
