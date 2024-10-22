cmake_minimum_required(VERSION 3.13)

project(codecrafters-interpreter)

file(GLOB_RECURSE SOURCE_FILES app/*.c app/*.h)

set(CMAKE_C_STANDARD 23) # Enable the C23 standard

add_executable(codecrafters-build-interpreter-c ${SOURCE_FILES})
