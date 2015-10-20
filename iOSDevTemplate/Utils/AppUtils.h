//
//  AppUtils.h
//  iOSDevTemplate
//
//  Created by zhucuirong on 15/7/6.
//  Copyright (c) 2015年 SINOFAKE SINEP. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DeviceVersion){
    iPhone4       = 3,
    iPhone4S      = 4,
    iPhone5       = 5,
    iPhone5C      = 6,
    iPhone5S      = 7,
    iPhone6       = 8,
    iPhone6Plus   = 9,
    iPhone6S      = 10,
    iPhone6SPlus  = 11,
    
    iPad1         = 12,
    iPad2         = 13,
    iPadMini      = 14,
    iPad3         = 15,
    iPad4         = 16,
    iPadAir       = 17,
    iPadMini2     = 18,
    iPadAir2      = 19,
    iPadMini3     = 20,
    iPadMini4     = 21,
    iPadPro       = 22,
    
    iPodTouch1Gen = 23,
    iPodTouch2Gen = 24,
    iPodTouch3Gen = 25,
    iPodTouch4Gen = 26,
    iPodTouch5Gen = 27,
    iPodTouch6Gen = 28,
    
    Simulator     = 0
};

static NSString *DeviceVersionNames[] = {
    [iPhone4]       = @"iPhone 4",
    [iPhone4S]      = @"iPhone 4S",
    [iPhone5]       = @"iPhone 5",
    [iPhone5C]      = @"iPhone 5C",
    [iPhone5S]      = @"iPhone 5S",
    [iPhone6]       = @"iPhone 6",
    [iPhone6Plus]   = @"iPhone 6 Plus",
    [iPhone6S]      = @"iPhone 6S",
    [iPhone6SPlus]  = @"iPhone 6S Plus",
    
    [iPad1]         = @"iPad 1",
    [iPad2]         = @"iPad 2",
    [iPadMini]      = @"iPad Mini",
    [iPad3]         = @"iPad 3",
    [iPad4]         = @"iPad 4",
    [iPadAir]       = @"iPad Air",
    [iPadMini2]     = @"iPad Mini 2",
    [iPadAir2]      = @"iPad Air 2",
    [iPadMini3]     = @"iPad Mini 3",
    [iPadMini4]     = @"iPad Mini 4",
    [iPadPro]       = @"iPad Pro",
    
    [iPodTouch1Gen] = @"iPod Touch 1st Gen",
    [iPodTouch2Gen] = @"iPod Touch 2nd Gen",
    [iPodTouch3Gen] = @"iPod Touch 3rd Gen",
    [iPodTouch4Gen] = @"iPod Touch 4th Gen",
    [iPodTouch5Gen] = @"iPod Touch 5th Gen",
    [iPodTouch6Gen] = @"iPod Touch 6th Gen",
    
    [Simulator]     = @"Simulator"
};


typedef NS_ENUM(NSInteger, DeviceSize){
    UnknownSize     = 0,
    Screen3Dot5inch = 1,
    Screen4inch     = 2,
    Screen4Dot7inch = 3,
    Screen5Dot5inch = 4
};

static NSString *DeviceSizeNames[] = {
    [UnknownSize]     = @"Unknown Size",
    [Screen3Dot5inch] = @"3.5 inch",
    [Screen4inch]     = @"4 inch",
    [Screen4Dot7inch] = @"4.7 inch",
    [Screen5Dot5inch] = @"5.5 inch"
};

@interface AppUtils : NSObject

+ (UIImage*)appIcon;

+ (NSString *)appName;
+ (NSString *)bundleName;
+ (NSString *)appVersion;
+ (NSString *)buildVersion;
+ (DeviceVersion)deviceVersion;
+ (DeviceSize)deviceSize;
+ (NSString*)deviceName;  //e.g. iPhone7,2



/*
 Checks if the device is jailbroken or not.
 
 @returns  Yes if the device is jailbroken.
 */
+ (BOOL)isJailbroken;

@end
