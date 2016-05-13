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
    return [UIImage imageWithColor:color andSize:CGSizeMake(1, 1)];
}

+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size {
    //// Draws the background colored image.
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width*([UIScreen mainScreen].scale), size.height*([UIScreen mainScreen].scale));
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(rect.size.width, rect.size.height), NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
