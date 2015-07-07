//
//  MBProgressHUDWrap.m
//  ElongIpadClient
//
//  Created by zhucuirong on 15/4/15.
//  Copyright (c) 2015年 dragonyuan. All rights reserved.
//

#import "MBProgressHUDWrap.h"

static const CGFloat kHUDShowTime = 1.5f; //自动hide的HUD的默认显示时间

static inline void CommonConfigureForHUD(MBProgressHUD *hud) {
    //hud.opacity = 0.5f;
    //hud.minShowTime = HUD_ShowTime;
    //hud.minSize = CGSizeMake(135.f, 135.f);
    //hud.margin = 10.f;
}

@implementation MBProgressHUDWrap

#pragma mark - Success,Error Image
+ (UIImageView *)successImageView {
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark"]];
}

+ (UIImageView *)errorImageView {
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark"]];
}

#pragma mark - 持续的HUD
+ (MBProgressHUD *)showPersistentHUDAddedTo:(UIView *)view withText:(NSString *)text {
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:hud];
    CommonConfigureForHUD(hud);
    hud.labelText = text;
    [hud show:YES];
    return hud;
}

+ (void)switchHUD:(MBProgressHUD *)hud withType:(HUDSwitchType)type text:(NSString *)text completionBlock:(MBProgressHUDCompletionBlock)completionBlock {
    switch (type) {
        case HUDSwitchTypeTextOnly:
        {
            NSAssert(text, @"HUDSwitchTypeTextOnly type text can't be nil");
            hud.mode = MBProgressHUDModeText;
            hud.labelText = text;
        }
            break;
        case HUDSwitchTypeSuccess:
        case HUDSwitchTypeError:
        {
            hud.mode = MBProgressHUDModeCustomView;
            hud.labelText = text;
            hud.square = YES;
            if (type == HUDSwitchTypeSuccess) {
                hud.customView = [MBProgressHUDWrap successImageView];
            }
            else {
                hud.customView = [MBProgressHUDWrap errorImageView];
            }
        }
            break;
            
        default:
            break;
    }
    if (completionBlock) {
        hud.completionBlock = completionBlock;
    }
    [hud hide:YES afterDelay:kHUDShowTime];
}

#pragma mark - 临时的HUD
+ (MBProgressHUD *)showTemporaryHUDWithType:(HUDTemporaryType)type addedTo:(UIView *)view text:(NSString *)text {
    return [MBProgressHUDWrap showTemporaryHUDWithType:type addedTo:view text:text duration:kHUDShowTime completionBlock:nil];
}

+ (MBProgressHUD *)showTemporaryHUDWithType:(HUDTemporaryType)type addedTo:(UIView *)view text:(NSString *)text completionBlock:(MBProgressHUDCompletionBlock)completionBlock {
    return [MBProgressHUDWrap showTemporaryHUDWithType:type addedTo:view text:text duration:kHUDShowTime completionBlock:completionBlock];
}

+ (MBProgressHUD *)showTemporaryHUDWithType:(HUDTemporaryType)type addedTo:(UIView *)view text:(NSString *)text duration:(NSTimeInterval)duration completionBlock:(MBProgressHUDCompletionBlock)completionBlock {
    /**
     HUDTemporaryTypeTextOnly         = 0,//就一个文本
     HUDTemporaryTypeIndicatorOnly    = 1,//就一个菊花
     HUDTemporaryTypeIndicatorAndText = 2,//菊花和文本
     HUDTypeTemporarySuccess          = 3,//
     HUDTypeTemporaryError            = 4//
     */
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    CommonConfigureForHUD(hud);
    
    switch (type) {
        case HUDTemporaryTypeTextOnly:
            hud.mode = MBProgressHUDModeText;
            hud.labelText = text;
            break;
        case HUDTemporaryTypeIndicatorOnly:
            break;
        case HUDTemporaryTypeIndicatorAndText:
            hud.labelText = text;
            break;
        case HUDTemporaryTypeSuccess:
        {
            hud.labelText = text;
            hud.mode = MBProgressHUDModeCustomView;
            hud.square = YES;
            hud.customView = [MBProgressHUDWrap successImageView];
        }
            break;
        case HUDTemporaryTypeError:
        {
            hud.labelText = text;
            hud.mode = MBProgressHUDModeCustomView;
            hud.square = YES;
            hud.customView = [MBProgressHUDWrap errorImageView];
        }
            break;
        default:
            break;
    }
    
    if (completionBlock) {
        hud.completionBlock = completionBlock;
    }
    [hud hide:YES afterDelay:duration];
    return hud;
}

@end
