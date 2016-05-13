//
//  UIImage+Capture.h
//  iOSDevTemplate
//
//  Created by zhucuirong on 16/5/13.
//  Copyright © 2016年 SINOFAKE SINEP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Capture)

+ (UIImage *)screenshot;//当前屏幕快照

+ (UIImage *)composeWithHeader:(UIImage *)header content:(UIImage *)content footer:(UIImage *)footer;

+ (UIImage*)captureView:(UIView *)theView;

@end
