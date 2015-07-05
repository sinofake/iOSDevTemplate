//
//  AccountManager.h
//  iOSDevTemplate
//
//  Created by zhucuirong on 15/7/5.
//  Copyright (c) 2015年 SINOFAKE SINEP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccountManager : NSObject

+ (instancetype)sharedInstance;

- (void)cleanup;

@end
