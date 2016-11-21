wget https://s3.amazonaws.com/mozilla-games/emscripten/releases/emsdk-portable.tar.gz
tar -xvf emsdk-portable.tar.gz
cd /emsdk_portable
./emsdk update
./emsdk install latest
./emsdk activate latest

git clone https://github.com/WebAssembly/binaryen.git
cd /binaryen && cmake . && make

ln -s /Users/joshua/Projects/emsdk_portable/emscripten/1.35.0/emcc /usr/local/bin/emcc
ln -s /Users/joshua/Projects/emsdk_portable/emscripten/1.35.0/em++ /usr/local/bin/em++

emcc /src/index.cpp -s BINARYEN=1 -s WASM=1 -O1 -s ONLY_MY_CODE=1 -o index.html

emcc index.cpp -s BINARYEN=1 -s WASM=1 -O1 -s ONLY_MY_CODE=1 -o index.html 
python -m SimpleHTTPServer 8080