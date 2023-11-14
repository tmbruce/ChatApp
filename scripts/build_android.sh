#!/bin/zsh

BLUE='\033[1;34m'

RN_ANDROID_DIR='./android/src/main'
RUST_DIR='./rust_module'

ARCHS=("aarch64-linux-android" "armv7-linux-androideabi")
ARCH_FOLDERS=("arm64-v8a" "armeabi-v7a")

for index in {1..${#ARCHS[@]}}; do
    arch=${ARCHS[$index]}
    arch_folder=${ARCH_FOLDERS[$index]}
    echo "${BLUE}Building for $arch..."
    cd $RUST_DIR
    cargo ndk build --release --target $arch
    cd ..
    rm -rf $RN_ANDROID_DIR/jniLibs/$arch_folder
    mkdir -p $RN_ANDROID_DIR/jniLibs/$arch_folder
    echo "${BLUE}Copying native modules to Android project..."
    cp $RUST_DIR/target/$arch/release/librust_module.a $RN_ANDROID_DIR/jniLibs/$arch_folder/librust_module.a
    rm -rf $RUST_DIR/target/$arch
done