//
//  rust_module.m
//  ChatApp
//
//  Created by Travis Bruce on 11/11/23.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#include "rust_module.h"

@interface RustModule : NSObject <RCTBridgeModule>
@end

@implementation RustModule

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(addNumbers:(int)a b:(int)b
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    int result = add_numbers(a, b);
    resolve(@(result));
}

@end
