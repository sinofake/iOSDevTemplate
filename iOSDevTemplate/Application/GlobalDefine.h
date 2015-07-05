//
//  GlobalDefine.h
//  iOSDevTemplate
//
//  Created by zhucuirong on 15/7/6.
//  Copyright (c) 2015年 SINOFAKE SINEP. All rights reserved.
//

#ifndef iOSDevTemplate_GlobalDefine_h
#define iOSDevTemplate_GlobalDefine_h

#define BASE_URL @"http://sinofake.com/"




////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define UIColorFromHex(hex) [UIColor colorWithRed:((CGFloat)((hex & 0xFF0000) >> 16))/255.0 green:((CGFloat)((hex & 0xFF00) >> 8))/255.0 blue:((CGFloat)(hex & 0xFF))/255.0 alpha:1.0]

#define UIColorFromHexAndAlpha(hex, a) [UIColor colorWithRed:((CGFloat)((hex & 0xFF0000) >> 16))/255.0 green:((CGFloat)((hex & 0xFF00) >> 8))/255.0 blue:((CGFloat)(hex & 0xFF))/255.0 alpha:a]

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
#define TEXTSIZE(text, font, maxSize) [text length] > 0 ? [text \
boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) \
attributes:@{NSFontAttributeName:font} context:nil].size : CGSizeZero;
#else
#define TEXTSIZE(text, font, maxSize) [text length] > 0 ? [text \
sizeWithFont:font constrainedToSize:maxSize lineBreakMode:NSLineBreakByWordWrapping] : CGSizeZero;
#endif

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// block self
#define WEAK_SELF __weak __typeof(self)weakSelf = self;
#define STRONG_SELF __strong __typeof(weakSelf)strongSelf = weakSelf;


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//A better version of NSLog
#ifdef DEBUG
#define NSLog(format, ...) do {                                                                          \
fprintf(stderr, "<%s : %d> %s\n",                                           \
[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
__LINE__, __func__);                                                        \
(NSLog)((format), ##__VA_ARGS__);                                           \
fprintf(stderr, "-------\n");                                               \
} while (0)
#else
#define NSLog(...) {}
#endif


#endif
