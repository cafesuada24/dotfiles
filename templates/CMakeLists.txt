cmake_minimum_required(VERSION 3.20)

# 1. Define project name and language
project({{PROJECT_NAME}} VERSION 1.0.0 LANGUAGES C CXX)

# 2. Enforce C++ standard
set(CMAKE_CXX_STANDARD {{CPP_STANDARD}})
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF) # Strict ISO C++

# 3. Define include directories
include_directories(include)
