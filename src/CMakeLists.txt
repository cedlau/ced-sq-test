cmake_minimum_required(VERSION 3.16)

project(libbuggy)

set(srcs
    buggies.cpp
    utils.cpp
    )
    
set(headers
    buggies.h
    utils.h
    )

add_library(buggy SHARED ${headers} ${srcs})

install(TARGETS buggy DESTINATION .)
