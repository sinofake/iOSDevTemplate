//
//  AppUtils.m
//  iOSDevTemplate
//
//  Created by zhucuirong on 15/7/6.
//  Copyright (c) 2015年 SINOFAKE SINEP. All rights reserved.
//

#import "AppUtils.h"
#import <sys/utsname.h>

@implementation AppUtils

+ (NSString*)appIconPath {
    NSString* iconFilename = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIconFile"] ;
    NSString* iconBasename = [iconFilename stringByDeletingPathExtension] ;
    NSString* iconExtension = [iconFilename pathExtension] ;
    return [[NSBundle mainBundle] pathForResource:iconBasename
                                           ofType:iconExtension] ;
}

+ (UIImage*)appIcon {
    UIImage*appIcon = [[UIImage alloc] initWithContentsOfFile:[self appIconPath]];
    return appIcon;
}

+ (NSString *)appName {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

+ (NSString *)bundleName {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"];
}


+ (NSString *)appVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)buildVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (NSDictionary*)deviceNamesByCode {
    static NSDictionary* deviceNamesByCode = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        deviceNamesByCode = @{
                              //iPhones
                              @"iPhone3,1" :[NSNumber numberWithInteger:iPhone4],
                              @"iPhone3,2" :[NSNumber numberWithInteger:iPhone4],
                              @"iPhone3,3" :[NSNumber numberWithInteger:iPhone4],
                              @"iPhone4,1" :[NSNumber numberWithInteger:iPhone4S],
                              @"iPhone4,2" :[NSNumber numberWithInteger:iPhone4S],
                              @"iPhone4,3" :[NSNumber numberWithInteger:iPhone4S],
                              @"iPhone5,1" :[NSNumber numberWithInteger:iPhone5],
                              @"iPhone5,2" :[NSNumber numberWithInteger:iPhone5],
                              @"iPhone5,3" :[NSNumber numberWithInteger:iPhone5C],
                              @"iPhone5,4" :[NSNumber numberWithInteger:iPhone5C],
                              @"iPhone6,1" :[NSNumber numberWithInteger:iPhone5S],
                              @"iPhone6,2" :[NSNumber numberWithInteger:iPhone5S],
                              @"iPhone7,2" :[NSNumber numberWithInteger:iPhone6],
                              @"iPhone7,1" :[NSNumber numberWithInteger:iPhone6Plus],
                              @"iPhone8,1" :[NSNumber numberWithInteger:iPhone6S],
                              @"iPhone8,2" :[NSNumber numberWithInteger:iPhone6SPlus],
                              @"i386"      :[NSNumber numberWithInteger:Simulator],
                              @"x86_64"    :[NSNumber numberWithInteger:Simulator],
                              
                              
                              //iPads
                              @"iPad1,1" :[NSNumber numberWithInteger:iPad1],
                              @"iPad2,1" :[NSNumber numberWithInteger:iPad2],
                              @"iPad2,2" :[NSNumber numberWithInteger:iPad2],
                              @"iPad2,3" :[NSNumber numberWithInteger:iPad2],
                              @"iPad2,4" :[NSNumber numberWithInteger:iPad2],
                              @"iPad2,5" :[NSNumber numberWithInteger:iPadMini],
                              @"iPad2,6" :[NSNumber numberWithInteger:iPadMini],
                              @"iPad2,7" :[NSNumber numberWithInteger:iPadMini],
                              @"iPad3,1" :[NSNumber numberWithInteger:iPad3],
                              @"iPad3,2" :[NSNumber numberWithInteger:iPad3],
                              @"iPad3,3" :[NSNumber numberWithInteger:iPad3],
                              @"iPad3,4" :[NSNumber numberWithInteger:iPad4],
                              @"iPad3,5" :[NSNumber numberWithInteger:iPad4],
                              @"iPad3,6" :[NSNumber numberWithInteger:iPad4],
                              @"iPad4,1" :[NSNumber numberWithInteger:iPadAir],
                              @"iPad4,2" :[NSNumber numberWithInteger:iPadAir],
                              @"iPad4,3" :[NSNumber numberWithInteger:iPadAir],
                              @"iPad4,4" :[NSNumber numberWithInteger:iPadMini2],
                              @"iPad4,5" :[NSNumber numberWithInteger:iPadMini2],
                              @"iPad4,6" :[NSNumber numberWithInteger:iPadMini2],
                              @"iPad4,7" :[NSNumber numberWithInteger:iPadMini3],
                              @"iPad4,8" :[NSNumber numberWithInteger:iPadMini3],
                              @"iPad4,9" :[NSNumber numberWithInteger:iPadMini3],
                              @"iPad5,1" :[NSNumber numberWithInteger:iPadMini4],
                              @"iPad5,2" :[NSNumber numberWithInteger:iPadMini4],
                              @"iPad5,3" :[NSNumber numberWithInteger:iPadAir2],
                              @"iPad5,4" :[NSNumber numberWithInteger:iPadAir2],
                              @"iPad6,8" :[NSNumber numberWithInteger:iPadPro],
                              
                              //iPods
                              @"iPod1,1" :[NSNumber numberWithInteger:iPodTouch1Gen],
                              @"iPod2,1" :[NSNumber numberWithInteger:iPodTouch2Gen],
                              @"iPod3,1" :[NSNumber numberWithInteger:iPodTouch3Gen],
                              @"iPod4,1" :[NSNumber numberWithInteger:iPodTouch4Gen],
                              @"iPod5,1" :[NSNumber numberWithInteger:iPodTouch5Gen],
                              @"iPod7,1" :[NSNumber numberWithInteger:iPodTouch6Gen]
                              
                              };
    });
    
    return deviceNamesByCode;
}

+ (DeviceVersion)deviceVersion {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *code = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    DeviceVersion version = (DeviceVersion)[[self.deviceNamesByCode objectForKey:code] integerValue];
    
    return version;
}

+ (DeviceSize)deviceSize {
    CGFloat screenHeight = 0;
    
    if (iOSVersionGreaterThanOrEqualTo(@"8")) {
        screenHeight = MAX([[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width);
    }else
        screenHeight = [[UIScreen mainScreen] bounds].size.height;
    
    if (screenHeight == 480)
        return Screen3Dot5inch;
    else if(screenHeight == 568)
        return Screen4inch;
    else if(screenHeight == 667){
        if ([UIScreen mainScreen].scale > 2.9) return Screen5Dot5inch;
        return  Screen4Dot7inch;
    }else if(screenHeight == 736)
        return Screen5Dot5inch;
    else
        return UnknownSize;
}

+ (NSString*)deviceName {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *code = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if ([code isEqualToString:@"x86_64"] || [code isEqualToString:@"i386"])
        code = @"Simulator";
    
    return code;
}

+ (BOOL)isJailbroken {
#if TARGET_OS_IPHONE
    NSURL *URL = [NSURL URLWithString:@"cydia://"];
    return [[UIApplication sharedApplication] canOpenURL:URL];
#else
    return NO;
#endif
}


@end
