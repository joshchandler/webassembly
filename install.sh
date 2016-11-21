#!/usr/bin/env bash

base_dir=`pwd`
lib_dir=base_dir + '/lib'

wget https://s3.amazonaws.com/mozilla-games/emscripten/releases/emsdk-portable.tar.gz
tar -xvf emsdk-portable.tar.gz
rm -f emsdk-portable.tar.gz
cd emsdk_portable
./emsdk update
./emsdk install clang-incoming-64bit sdk-incoming-64bit
./emsdk activate clang-incoming-64bit sdk-incoming-64bit

# clang-incoming-64bit emscripten-incoming-64bit

cd $lib_dir
git clone --recursive https://github.com/WebAssembly/wabt
cd wabt
make -j8

cd $lib_dir
git clone https://github.com/WebAssembly/binaryen.git
cd binaryen && cmake . && make



