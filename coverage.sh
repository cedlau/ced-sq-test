#!/usr/bin/env bash

set -eu
set -o pipefail

# references
# http://clang.llvm.org/docs/UsersManual.html#profiling-with-instrumentation
# https://www.bignerdranch.com/blog/weve-got-you-covered/
# https://www.osadl.org/Dumping-gcov-data-at-runtime-simple-ex.online-coverage-analysis.0.html
# https://github.com/mapbox/cpp#code-coverage
# https://github.com/mapbox/node-cpp-skel/blob/main/scripts/coverage.sh

export CXX=/usr/bin/clang++-10
export LINK=/usr/bin/clang++-10
export GYP_DEFINES="clang=1"

export CXXFLAGS="-fprofile-instr-generate -fcoverage-mapping"
export LDFLAGS="-fprofile-instr-generate"

rm -f *profraw
rm -f *gcov
rm -f *profdata
LLVM_PROFILE_FILE="code-%p.profraw" ./build/test/tu_buggies

llvm-profdata merge -output=code.profdata code-*.profraw
llvm-cov report ${CXX_MODULE} -instr-profile=code.profdata -use-color -ignore-filename-regex=src/vendors/* -ignore-filename-regex=node_modules/* -ignore-filename-regex=/usr/include/nodejs/src/node_api.h
llvm-cov show ${CXX_MODULE} -instr-profile=code.profdata srccpp/*.cpp -path-equivalence -use-color -ignore-filename-regex=src/vendors/* -ignore-filename-regex=node_modules/*  -ignore-filename-regex=/usr/include/nodejs/src/node_api.h --format html > coverage.html
#llvm-cov show ${CXX_MODULE} -instr-profile=code.profdata srccpp/*.cpp -path-equivalence -use-color --format html > coverage.html
#echo "open coverage.html for HTML version of this report"