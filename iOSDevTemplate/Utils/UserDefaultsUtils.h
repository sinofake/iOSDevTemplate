//
//  UserDefaultsUtils.h
//  iOSDevTemplate
//
//  Created by zhucuirong on 15/7/7.
//  Copyright (c) 2015年 SINOFAKE SINEP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefaultsUtils : NSObject

+ (id)objectForKey:(NSString *)defaultName;
+ (void)setObject:(id)value forKey:(NSString *)defaultName;
+ (void)removeObjectForKey:(NSString *)defaultName;

+ (BOOL)boolForKey:(NSString *)defaultName;
+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName;

+ (void)print;

/*
 Adds a given custom object key-value pair to the NSUserDefaults.
 
 @param anObject The custm object value.
 @param aKey The key for value.
 */
+ (void)setCustomObject:(id)anObject forKey:(NSString *)aKey;

/*
 Returns a custom object value associated with a given key from the NSUserDefaults.
 
 @param aKey The key for which to return the corresponding value.
 @returns The value associated with aKey.
 */
+ (id)customObjectForKey:(NSString *)aKey;



@end
