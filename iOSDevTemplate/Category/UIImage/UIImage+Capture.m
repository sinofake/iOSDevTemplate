//
//  UIImage+Capture.m
//  iOSDevTemplate
//
//  Created by zhucuirong on 16/5/13.
//  Copyright © 2016年 SINOFAKE SINEP. All rights reserved.
//

#import "UIImage+Capture.h"

@implementation UIImage (Capture)

+ (UIImage *)screenshot {
    CGSize imageSize = CGSizeZero;
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        imageSize = [UIScreen mainScreen].bounds.size;
    } else {
        imageSize = CGSizeMake([UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
    }
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (UIWindow *window in [[UIApplication sharedApplication] windows]) {
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, window.center.x, window.center.y);
        CGContextConcatCTM(context, window.transform);
        CGContextTranslateCTM(context, -window.bounds.size.width * window.layer.anchorPoint.x, -window.bounds.size.height * window.layer.anchorPoint.y);
        if (orientation == UIInterfaceOrientationLandscapeLeft) {
            CGContextRotateCTM(context, M_PI_2);
            CGContextTranslateCTM(context, 0, -imageSize.width);
        } else if (orientation == UIInterfaceOrientationLandscapeRight) {
            CGContextRotateCTM(context, -M_PI_2);
            CGContextTranslateCTM(context, -imageSize.height, 0);
        } else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
            CGContextRotateCTM(context, M_PI);
            CGContextTranslateCTM(context, -imageSize.width, -imageSize.height);
        }
        if ([window respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
            [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:YES];
        } else {
            [window.layer renderInContext:context];
        }
        CGContextRestoreGState(context);
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)composeWithHeader:(UIImage *)header content:(UIImage *)content footer:(UIImage *)footer {
    CGSize size = CGSizeMake(content.size.width, header.size.height + content.size.height + footer.size.height);
    UIGraphicsBeginImageContext(size);
    [header drawInRect:CGRectMake(0,
                                  0,
                                  header.size.width,
                                  header.size.height)];
    [content drawInRect:CGRectMake(0,
                                   header.size.height,
                                   content.size.width,
                                   content.size.height)];
    [footer drawInRect:CGRectMake(0,
                                  header.size.height + content.size.height,
                                  footer.size.width,
                                  footer.size.height)];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage*)captureView:(UIView *)theView {
    UIImage *image = nil;
    
    if ([theView isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scrollView = (UIScrollView *)theView;
        
        UIGraphicsBeginImageContext(scrollView.contentSize);
        CGPoint savedContentOffset = scrollView.contentOffset;
        CGRect savedFrame = scrollView.frame;
        scrollView.contentOffset = CGPointZero;
        scrollView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height);
        
        if ([scrollView respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
            [scrollView drawViewHierarchyInRect:scrollView.bounds afterScreenUpdates:NO];
        } else {
            [scrollView.layer renderInContext:UIGraphicsGetCurrentContext()];
        }
        image = UIGraphicsGetImageFromCurrentImageContext();
        
        scrollView.contentOffset = savedContentOffset;
        scrollView.frame = savedFrame;
        UIGraphicsEndImageContext();
    } else {
        UIGraphicsBeginImageContext(theView.frame.size);
        if ([theView respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
            [theView drawViewHierarchyInRect:theView.bounds afterScreenUpdates:YES];
        } else {
            [theView.layer renderInContext:UIGraphicsGetCurrentContext()];
        }
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    return image;
}

@end
