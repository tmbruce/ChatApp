package com.chatapp;

//TODO: REMOVE LOGGING STATEMENTS
import android.util.Log;

import androidx.annotation.NonNull;

import com.facebook.react.ReactPackage;
import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.uimanager.ViewManager;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class RustModulePackage implements ReactPackage {
    @NonNull
    @Override
    public List<NativeModule> createNativeModules(@NonNull ReactApplicationContext reactContext) {
        Log.d("MyTag", "createNativeModules is being run");
        List<NativeModule> modules = new ArrayList<>();
        modules.add(new RustModule(reactContext));
        return modules;
    }

    @NonNull
    @Override
    public List<ViewManager> createViewManagers(@NonNull ReactApplicationContext reactContext) {
        Log.d("MyTag", "createViewManagers is being run");
        return Collections.emptyList();
    }
}