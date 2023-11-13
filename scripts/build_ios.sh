#!/bin/zsh

BLUE='\033[1;34m'

clear
cd rust_module
rm -rf target

echo "${BLUE}Compiling native module for iOS..."
cargo build --release --target aarch64-apple-ios-sim

rm rust_module.h
echo "${BLUE}Generating header file..."
cbindgen --lang c --crate rust_module --output rust_module.h

cd ..
echo "${BLUE}Building iOS static library..."
rm -rf ios/rust_module.xcframework

cd rust_module
xcodebuild -create-xcframework -library target/aarch64-apple-ios-sim/release/librust_module.a -headers rust_module.h -output ../ios/rust_module.xcframework