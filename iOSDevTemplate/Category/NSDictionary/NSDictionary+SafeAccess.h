//
//  NSDictionary+SafeAccess.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 15/1/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSDictionary (SafeAccess)

- (id)safeObjectForKey:(id)aKey;

- (NSString*)stringForKey:(id)key;

- (NSNumber*)numberForKey:(id)key;

- (NSDecimalNumber *)decimalNumberForKey:(id)key;

- (NSArray*)arrayForKey:(id)key;

- (NSDictionary*)dictionaryForKey:(id)key;

- (NSInteger)integerForKey:(id)key;

- (NSUInteger)unsignedIntegerForKey:(id)key;

- (BOOL)boolForKey:(id)key;

- (float)floatForKey:(id)key;

- (double)doubleForKey:(id)key;

- (long long)longLongForKey:(id)key;

- (unsigned long long)unsignedLongLongForKey:(id)key;

//CG
- (CGFloat)CGFloatForKey:(id)key;
@end


#pragma --mark NSMutableDictionary setter

@interface NSMutableDictionary(SafeAccess)

/*
 Adds a given safe key-value pair to the dictionary.
 
 @param anObject The none-nil value for aKey. A strong reference to the object is maintained by the dictionary. Raises an NSInvalidArgumentException if anObject is nil. If the value is nil value, sets automatically a NSNull reference instead.
 @param aKey The key for value. The key is copied (using copyWithZone:; keys must conform to the NSCopying protocol). Raises an NSInvalidArgumentException if aKey is nil. If aKey already exists in the dictionary anObject takes its place.
 */
- (void)setSafeObject:(id)anObject forKey:(id <NSCopying>)aKey;

@end