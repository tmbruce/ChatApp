package com.chatapp;
import androidx.annotation.NonNull;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Promise;

public class RustModule extends ReactContextBaseJavaModule {

    public static ReactApplicationContext reactContext;

    private static native int nativeAddNumbers(int a, int b);

    // Load the Rust library
    static {
        System.loadLibrary("rust_module");
    }

    RustModule(ReactApplicationContext context) {
        super(context);
        reactContext = context;
    }

    @NonNull
    @Override
    public String getName() {
        return "RustModule";
    }

    @ReactMethod
    public void addNumbers(int a, int b, final Promise promise) {
        int result = RustModule.nativeAddNumbers(a, b);
        promise.resolve(result);
    }
}