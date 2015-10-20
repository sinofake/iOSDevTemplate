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

- (NSString *)ss_md5;

- (NSString *)reversedString;

- (NSString *)trimmingWhitespace;
- (NSString *)trimmingWhitespaceAndNewlines;

///Unicode编码的字符串转成NSString
- (NSString *)makeUnicodeToString;

- (NSString *)capitalizedSentence;

- (NSInteger)numberOfLineBreaks;


///--------------------------
/// @name Working with Ranges
///--------------------------

/**
 Adjust a range to account for composed characters.
 
 @param range Input range
 @return adjusted range
 */
- (NSRange)ss_composedRangeWithRange:(NSRange)range;

/**
 Adjust a range to account for composed characters and get a substring for that range.
 
 @param range Input range
 @return Substring with adjusted range
 */
- (NSString *)ss_composedSubstringWithRange:(NSRange)range;

/**
 Get the range of a word for a given character index.
 
 @param index Character index
 @return Range of the containing word.
 */
- (NSRange)ss_wordRangeAtIndex:(NSUInteger)index;

@end
