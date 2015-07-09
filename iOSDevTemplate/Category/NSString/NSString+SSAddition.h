//
//  NSString+SSAddition.h
//  iOSDevTemplate
//
//  Created by zhucuirong on 15/7/9.
//  Copyright (c) 2015年 SINOFAKE SINEP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SSAddition)

- (BOOL)ss_containsString:(NSString *)string;

- (NSString *)reversedString;

- (NSString *)stringByStrippingHTML;
- (NSString *)stringByRemovingScriptsAndStrippingHTML;

- (NSString *)trimmingWhitespace;
- (NSString *)trimmingWhitespaceAndNewlines;

///Unicode编码的字符串转成NSString
- (NSString *)makeUnicodeToString;

- (NSString *)capitalizedSentence;

- (NSInteger)numberOfLineBreaks;

@end
