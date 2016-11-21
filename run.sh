#!/usr/bin/env bash

. ./lib/emsdk_portable/emsdk_env.sh
PATH=$PATH:`pwd`/lib/wabt/out:`pwd`/lib/binaryen/bin:`pwd`/lib/emsdk_portable/emscripten/incoming

#emcc ./src/main.cc -s WASM=1 -O2 -o ./build/index.js
emcc ./src/main.cc -s WASM=1 -O1 -o ./build/index.js

cd build && python3 -m http.server 8000
