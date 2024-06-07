#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <StoreKit/StoreKit.h>
#import <React/RCTLog.h>

@interface SKAdNetworkModule : NSObject <RCTBridgeModule>
@end

@implementation SKAdNetworkModule

RCT_EXPORT_MODULE();

+ (BOOL)requiresMainQueueSetup {
    return NO;
}

RCT_EXPORT_METHOD(setConversionValue:(NSInteger)fineValue
                  coarseValue:(NSInteger)coarseValue
                  lockWindow:(BOOL)lockWindow
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
  
    RCTLogInfo(@"SKAdNetworkModule setting fine conversion value to: %ld, coarse conversion value to: %ld, lock window: %d", (long)fineValue, (long)coarseValue, lockWindow);
    
    if (fineValue < 0 || fineValue >= 64) {
        reject(@"invalid_fine_value", [NSString stringWithFormat:@"Fine value must be between 0 and 63, received %ld", (long)fineValue], nil);
        return;
    }

    if (coarseValue < 0 || coarseValue > 2) {
        reject(@"invalid_coarse_value", [NSString stringWithFormat:@"Coarse value must be between 0 and 2, received %ld", (long)coarseValue], nil);
        return;
    }

    if (!(lockWindow == YES || lockWindow == NO)) {
        reject(@"invalid_lock_window", @"Lock window must be a boolean value (YES or NO)", nil);
        return;
    }

    if (@available(iOS 16.1, *)) {
        SKAdNetworkCoarseConversionValue coarseValueEnum;
        switch (coarseValue) {
            case 0:
                coarseValueEnum = SKAdNetworkCoarseConversionValueLow;
                break;
            case 1:
                coarseValueEnum = SKAdNetworkCoarseConversionValueMedium;
                break;
            case 2:
                coarseValueEnum = SKAdNetworkCoarseConversionValueHigh;
                break;
            default:
                reject(@"invalid_coarse_value", [NSString stringWithFormat:@"Coarse value must be between 0 and 2, received %ld", (long)coarseValue], nil);
                return;
        }

        [SKAdNetwork updatePostbackConversionValue:fineValue
                                       coarseValue:coarseValueEnum
                                         lockWindow:lockWindow
                                   completionHandler:^(NSError * _Nullable error) {
            if (error) {
                NSLog(@"Failed to update conversion value: %@", [error localizedDescription]);
                reject(@"update_error", [error localizedDescription], error);
            } else {
                resolve(@(YES));
            }
        }];
    } else if (@available(iOS 15.4, *)) {
        [SKAdNetwork updatePostbackConversionValue:fineValue completionHandler:^(NSError * _Nullable error) {
            if (error) {
                NSLog(@"Failed to update conversion value: %@", [error localizedDescription]);
                reject(@"update_error", [error localizedDescription], error);
            } else {
                resolve(@(YES));
            }
        }];
    } else if (@available(iOS 14.0, *)) {
        if (fineValue == 0) {
            [SKAdNetwork registerAppForAdNetworkAttribution];
            resolve(@(YES));
        } else {
            [SKAdNetwork updateConversionValue:fineValue];
            resolve(@(YES));
        }
    } else if (@available(iOS 11.3, *)) {
        [SKAdNetwork registerAppForAdNetworkAttribution];
        resolve(@(YES));
    } else {
        reject(@"version_not_supported", @"This iOS version is not compatible with SKAdNetwork", nil);
    }
}

@end
