cmake_minimum_required(VERSION 3.20)
project(nix_cpp_example LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include_directories(include)

add_executable(nix_cpp_example
    src/main.cpp
)