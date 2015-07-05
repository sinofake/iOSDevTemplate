//
//  BaseApi.h
//  Sinofake
//
//  Created by zhucuirong on 15/5/9.
//  Copyright (c) 2015年 SINOFAKE SINEP. All rights reserved.
//

#import "YTKRequest.h"
#import "RequestBaseModel.h"

@interface BaseApi : YTKRequest
@property (nonatomic, strong) RequestBaseModel *requestModel;

@end
