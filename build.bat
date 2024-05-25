

rmdir /S /Q build
mkdir build
pushd build
cmake -A x64 -DCMAKE_TOOLCHAIN_FILE=%VCPKG_ROOT%/scripts/buildsystems/vcpkg.cmake -DCMAKE_BUILD_TYPE=relwithdebinfo -DVCPKG_TARGET_TRIPLET=x64-windows ..
cmake --build . --config relwithdebinfo

popd

rem pause