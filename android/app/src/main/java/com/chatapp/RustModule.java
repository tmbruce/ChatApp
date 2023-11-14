package com.chatapp;

import androidx.annotation.NonNull;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Promise;

//TODO: REMOVE LOGGING STATEMENTS
import android.util.Log;

public class RustModule extends ReactContextBaseJavaModule {

    private static ReactApplicationContext reactContext;

    private static native int nativeAddNumbers(int a, int b);

    // Load the Rust library
    static {
        Log.d("MyTag", "static block is being run");
        System.loadLibrary("rust_module");
    }

    RustModule(ReactApplicationContext context) {
        super(context);
        Log.d("MyTag", "RustModule constructor is being run");
        reactContext = context;
    }

    @NonNull
    @Override
    public String getName() {
        return "RustModule";
    }

    @ReactMethod
    public void addNumbers(int a, int b, final Promise promise) {
        Log.d("MyTag", "RustModule constructor is being run");
        int result = RustModule.nativeAddNumbers(a, b);
        promise.resolve(result);
    }
}