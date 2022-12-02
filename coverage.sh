#!/usr/bin/env bash

set -eu
set -o pipefail

# references
# http://clang.llvm.org/docs/UsersManual.html#profiling-with-instrumentation
# https://www.bignerdranch.com/blog/weve-got-you-covered/
# https://www.osadl.org/Dumping-gcov-data-at-runtime-simple-ex.online-coverage-analysis.0.html
# https://github.com/mapbox/cpp#code-coverage
# https://github.com/mapbox/node-cpp-skel/blob/main/scripts/coverage.sh

export CC=/usr/bin/clang
export CXX=/usr/bin/clang++
export LINK=/usr/bin/clang++

export CXXFLAGS="-fprofile-instr-generate -fcoverage-mapping"
export LDFLAGS="-fprofile-instr-generate"

cmake .
make
./test/tu_buggies

rm -f *profraw
rm -f *gcov
rm -f *profdata
CXX_EXECUTABLE="./test/tu_buggies"
LLVM_PROFILE_FILE="code-%p.profraw" ${CXX_EXECUTABLE}

llvm-profdata merge -output=code.profdata code-*.profraw
llvm-cov report ${CXX_EXECUTABLE} -instr-profile=code.profdata -use-color -ignore-filename-regex=src/vendors/*
llvm-cov show ${CXX_EXECUTABLE} -instr-profile=code.profdata srccpp/*.cpp -path-equivalence -ignore-filename-regex=src/vendors/* --format text > coverage.txt
#llvm-cov show ${CXX_EXECUTABLE} -instr-profile=code.profdata srccpp/*.cpp -path-equivalence -use-color --format html > coverage.html
#echo "open coverage.html for HTML version of this report"
