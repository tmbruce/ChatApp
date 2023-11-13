#!/bin/zsh

BLUE='\033[1;34m'
RN_ANDROID_DIR='./android/src/main'
RUST_DIR='./rust_module'

ARCHS="aarch64-linux-android armv7-linux-androideabi"
ARCH_FOLDERS="arm64-v8a armeabi-v7a"

cd $RUST_DIR
for arch in $ARCHS
    do 
        echo "${BLUE}Building for $arch..."
        cargo ndk build --release --target $arch
done
cd ..


# echo "${BLUE}Compiling native modules for Android..."
# cargo ndk build --release  --target aarch64-linux-android 
# cargo ndk build --release  --target armv7-linux-androideabi
# cd ..

rm -rf $RN_ANDROID_DIR/jniLibs/arm64-v8a
rm -rf $RN_ANDROID_DIR/jniLibs/armeabi-v7a

mkdir -p $RN_ANDROID_DIR/jniLibs/arm64-v8a
mkdir -p $RN_ANDROID_DIR/jniLibs/armeabi-v7a

echo "${BLUE}Copying native modules to Android project..."
cp $RUST_DIR/target/aarch64-linux-android/release/librust_module.a $RN_ANDROID_DIR/jniLibs/arm64-v8a/librust_module.a
cp $RUST_DIR/target/armv7-linux-androideabi/release/librust_module.a $RN_ANDROID_DIR/jniLibs/armeabi-v7a/librust_module.a

rm -rf $RUST_DIR/target/aarch64-linux-android
rm -rf $RUST_DIR/target/armv7-linux-androideabi