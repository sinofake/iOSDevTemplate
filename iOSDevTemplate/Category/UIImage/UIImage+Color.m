//
//  UIImage+Color.m
//  iOSDevTemplate
//
//  Created by zhucuirong on 15/7/8.
//  Copyright (c) 2015年 SINOFAKE SINEP. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
