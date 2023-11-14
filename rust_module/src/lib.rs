use jni::objects::JClass;
use jni::sys::jint;
use jni::JNIEnv;

#[no_mangle]
pub extern "C" fn add_numbers(a: i32, b: i32) -> i32 {
    a + b
}

#[cfg(target_os = "android")]
#[no_mangle]
pub unsafe extern "C" fn Java_com_reactnativepro_RustModule_nativeAddNumbers(
    _env: JNIEnv,
    _class: JClass,
    a: jint,
    b: jint,
) -> jint {
    add_numbers(a, b)
}
