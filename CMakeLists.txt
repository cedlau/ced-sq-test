cmake_minimum_required (VERSION 3.16)
project (ced_sq_test)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O3 -g")
set(CMAKE_INSTALL_PREFIX "./")

enable_testing()

add_subdirectory(src)
add_subdirectory(test)
