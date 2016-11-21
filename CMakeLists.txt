cmake_minimum_required(VERSION 3.6)
project(webassembly)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

set(SOURCE_FILES src/main.cc)
add_executable(webassembly ${SOURCE_FILES})