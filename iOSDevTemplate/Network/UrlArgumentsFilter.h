//
//  UrlArgumentsFilter.h
//  Sinofake
//
//  Created by zhucuirong on 15/5/9.
//  Copyright (c) 2015年 SINOFAKE SINEP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YTKNetworkConfig.h>

/// 给url追加arguments，用于全局参数，比如AppVersion, ApiVersion等
@interface UrlArgumentsFilter : NSObject<YTKUrlFilterProtocol>

+ (UrlArgumentsFilter *)filterWithArguments:(NSDictionary *)arguments;

@end
