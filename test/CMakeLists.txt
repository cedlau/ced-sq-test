cmake_minimum_required(VERSION 3.16)
include(GoogleTest)

project(tu)

set(SRCS
    tu_all.cpp
    tu_buggies.cpp
    )
    
add_executable(tu_buggies ${SRCS})

gtest_discover_tests(tu_buggies)

target_link_libraries(tu_buggies buggy gtest pthread)

install(TARGETS tu_buggies DESTINATION .)
