//
//  AppLaunchHelper.m
//  iOSDevTemplate
//
//  Created by zhucuirong on 15/7/5.
//  Copyright (c) 2015年 SINOFAKE SINEP. All rights reserved.
//

#import "AppLaunchHelper.h"
#import <YTKNetworkConfig.h>

@implementation AppLaunchHelper

+ (void)launch {
    [self configureNetwork];
}

+ (void) configureNetwork {
    [YTKNetworkConfig sharedInstance].baseUrl = BASE_URL;
//    UrlArgumentsFilter *urlFilter = [UrlArgumentsFilter filterWithArguments:@{
//                                                                              @"app_name": @"music_artist",
//                                                                              @"version": @"50"}];
//    [[YTKNetworkConfig sharedInstance] addUrlFilter:urlFilter];
}


@end
