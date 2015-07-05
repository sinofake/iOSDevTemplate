//
//  BaseApi.m
//  Sinofake
//
//  Created by zhucuirong on 15/5/9.
//  Copyright (c) 2015年 SINOFAKE SINEP. All rights reserved.
//

#import "BaseApi.h"
#import "ApiHook.h"

@implementation BaseApi

- (instancetype)init
{
    self = [super init];
    if (self) {
        ApiHook *apiHook = [[ApiHook alloc] init];
        [self addAccessory:apiHook];
    }
    return self;
}

- (id)requestArgument {
    return [self.requestModel toDictionary];
}

@end
