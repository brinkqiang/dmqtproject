#!/bin/bash

rm -rf build
mkdir -p build
pushd build

cmake -DCMAKE_BUILD_TYPE=relwithdebinfo -DCMAKE_TOOLCHAIN_FILE=../dmvcpkg/vcpkg/scripts/buildsystems/vcpkg.cmake ..
cmake --build . --config relwithdebinfo

popd

# popd

# echo continue && read -n 1
