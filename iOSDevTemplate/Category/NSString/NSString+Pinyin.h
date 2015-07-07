//
//  NSString+Pinyin.h
//  Snowball
//
//  Created by croath on 11/11/13.
//  Copyright (c) 2013 Snowball. All rights reserved.
//
// https://github.com/croath/NSString-Pinyin
//  the Chinese Pinyin string of the nsstring

#import <Foundation/Foundation.h>

@interface NSString (Pinyin)
/**
  Example:  @"大荣爱小花"
  pinyinArray:
             (
             da,
             rong,
             ai,
             xiao,
             hua
             )
 */
- (NSString*)pinyinWithPhoneticSymbol;//dà róng ài xiǎo huā
- (NSString*)pinyin;//da rong ai xiao hua
- (NSArray*)pinyinArray;
- (NSString*)pinyinWithoutBlank;//darongaixiaohua
- (NSArray*)pinyinInitialsArray;
- (NSString*)pinyinInitialsString;//draxh

@end
