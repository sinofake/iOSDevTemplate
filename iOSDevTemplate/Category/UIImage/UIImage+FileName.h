//
//  UIImage+FileName.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FileName)

//图片不带缓存
+ (UIImage *)imageWithFileName:(NSString *)name;

@end
