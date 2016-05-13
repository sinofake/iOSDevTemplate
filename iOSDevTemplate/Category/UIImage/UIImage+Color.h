//
//  UIImage+Color.h
//  iOSDevTemplate
//
//  Created by zhucuirong on 15/7/8.
//  Copyright (c) 2015年 SINOFAKE SINEP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;

@end
