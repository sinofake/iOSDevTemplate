//
//  AccountManager.m
//  iOSDevTemplate
//
//  Created by zhucuirong on 15/7/5.
//  Copyright (c) 2015年 SINOFAKE SINEP. All rights reserved.
//

#import "AccountManager.h"

@implementation AccountManager

+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[[self class] alloc] init];
    });
    return sharedInstance;
}

- (void)cleanup {
    
}

@end
