//
//  MBProgressHUDWrap.h
//  ElongIpadClient
//
//  Created by zhucuirong on 15/4/15.
//  Copyright (c) 2015年 dragonyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"


//HUD类型 Temporary:临时的，自动消失
typedef NS_ENUM(NSInteger, HUDTemporaryType) {
    HUDTemporaryTypeTextOnly         = 0,//就一个文本
    HUDTemporaryTypeIndicatorOnly    = 1,//就一个菊花
    HUDTemporaryTypeIndicatorAndText = 2,//菊花和文本
    HUDTemporaryTypeSuccess          = 3,//
    HUDTemporaryTypeError            = 4//目前同Success一样
};

typedef NS_ENUM(NSInteger, HUDSwitchType) {
    HUDSwitchTypeTextOnly = 0,
    HUDSwitchTypeSuccess  = 1,
    HUDSwitchTypeError    = 2//目前同Success一样
};

@interface MBProgressHUDWrap : NSObject

/**
 *  显示一个持续的HUD，不会自动hide
 *
 *  @param view <#view description#>
 *  @param text 可以为nil
 *
 *  @return <#return value description#>
 */
+ (MBProgressHUD *)showPersistentHUDAddedTo:(UIView *)view withText:(NSString *)text;
/**
 *  切换到CustomView或TextOnly模式，该方法配合上面方法使用
 *
 *  @param type            <#type description#>
 *  @param text            <#text description#>
 *  @param completionBlock <#completionBlock description#>
 */
+ (void)switchHUD:(MBProgressHUD *)hud withType:(HUDSwitchType)type text:(NSString *)text completionBlock:(MBProgressHUDCompletionBlock)completionBlock;



////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/**
 *  临时的HUD，自动hide 默认duration:kHUDShowTime(1.5s)
 *
 *  @param type
 *  @param view <#view description#>
 *  @param text <#text description#>
 *
 *  @return <#return value description#>
 */
+ (MBProgressHUD *)showTemporaryHUDWithType:(HUDTemporaryType)type addedTo:(UIView *)view text:(NSString *)text;

/**
 *  completionBlock
 *
 *  @param type            <#type description#>
 *  @param view            <#view description#>
 *  @param text            <#text description#>
 *  @param completionBlock <#completionBlock description#>
 *
 *  @return <#return value description#>
 */
+ (MBProgressHUD *)showTemporaryHUDWithType:(HUDTemporaryType)type addedTo:(UIView *)view text:(NSString *)text completionBlock:(MBProgressHUDCompletionBlock)completionBlock;

/**
 *  duration & completionBlock
 *
 *  @param type            <#type description#>
 *  @param view            <#view description#>
 *  @param text            <#text description#>
 *  @param duration        <#duration description#>
 *  @param completionBlock <#completionBlock description#>
 *
 *  @return <#return value description#>
 */
+ (MBProgressHUD *)showTemporaryHUDWithType:(HUDTemporaryType)type addedTo:(UIView *)view text:(NSString *)text duration:(NSTimeInterval)duration completionBlock:(MBProgressHUDCompletionBlock)completionBlock;
@end
