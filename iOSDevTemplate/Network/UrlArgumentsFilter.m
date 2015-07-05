//
//  UrlArgumentsFilter.m
//  Sinofake
//
//  Created by zhucuirong on 15/5/9.
//  Copyright (c) 2015年 SINOFAKE SINEP. All rights reserved.
//

#import "UrlArgumentsFilter.h"
#import <YTKNetworkPrivate.h>

@interface UrlArgumentsFilter ()
@property (nonatomic, strong) NSDictionary *arguments;

@end

@implementation UrlArgumentsFilter

+ (UrlArgumentsFilter *)filterWithArguments:(NSDictionary *)arguments {
    return [[self alloc] initWithArguments:arguments];
}

- (id)initWithArguments:(NSDictionary *)arguments {
    self = [super init];
    if (self) {
        self.arguments = arguments;
    }
    return self;
}


- (NSString *)filterUrl:(NSString *)originUrl withRequest:(YTKBaseRequest *)request {
    return [YTKNetworkPrivate urlStringWithOriginUrlString:originUrl appendParameters:self.arguments];
}


@end
