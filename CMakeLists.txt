cmake_minimum_required(VERSION 3.20)
project(nix_cpp_starter_template LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include_directories(include)

if(DEFINED ENV{CXX_INCLUDE_PATH})
    include_directories(SYSTEM $ENV{CXX_INCLUDE_PATH})
endif()

add_executable(output
    src/main.cpp
)