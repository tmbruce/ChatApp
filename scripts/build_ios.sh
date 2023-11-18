#!/bin/zsh

BLUE='\033[1;34m'

echo "${BLUE}Reconfiguring Cargo.toml file..."

clear
cd rust_module
rm -rf rust_module.xcframework
rm -rf target

echo "${BLUE}Compiling native module for iOS..."
cargo build --release --target aarch64-apple-ios
cargo build --release --target aarch64-apple-ios-sim

rm rust_module*.h
echo "${BLUE}Generating header file..."
cbindgen --lang c --crate rust_module --output rust_module.h

cd ..
echo "${BLUE}Building iOS static library..."
rm -rf ios/rust_module.xcframework

xcodebuild -create-xcframework -library /Users/travis/Documents/Repos/chat-app/ChatApp/rust_module/target/aarch64-apple-ios/release/librust_module.a -headers ./rust_module/rust_module.h -library /Users/travis/Documents/Repos/chat-app/ChatApp/rust_module/target/aarch64-apple-ios-sim/release/librust_module.a -headers ./rust_module/rust_module.h -output ./rust_module/rust_module.xcframework
# mv rust_module/rust_module.xcframework ios/rust_module.xcframework