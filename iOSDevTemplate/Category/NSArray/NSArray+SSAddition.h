//
//  NSArray+SSAddition.h
//  iOSDevTemplate
//
//  Created by zhucuirong on 15/7/9.
//  Copyright (c) 2015年 SINOFAKE SINEP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (SSAddition)

- (id)randomObject;

- (NSArray *)reversedArray;

- (NSArray *)shuffledArray;

/**
 Returns the object returned by `mutableCopyWithZone:` where the zone is `nil`.
 
 This differs from `mutableCopy` in that it makes any contained `NSArray` objects or `NSDictionary` objects mutable as
 well. The returned dictionary follows standard memory management conventions for copied objects. You are responsible
 for releasing it.
 
 @return The object returned by the `NSMutableCopying` protocol method `mutableCopyWithZone:`, where the zone is `nil`.
 */
- (NSMutableArray *)deepMutableCopy NS_RETURNS_RETAINED;

@end



@interface NSMutableArray (SSAddition)
/**
 Shuffles the elements of this array in-place using the Fisher-Yates algorithm.
 */
- (void)shuffle;

@end
