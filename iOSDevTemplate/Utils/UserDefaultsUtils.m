//
//  UserDefaultsUtils.m
//  iOSDevTemplate
//
//  Created by zhucuirong on 15/7/7.
//  Copyright (c) 2015年 SINOFAKE SINEP. All rights reserved.
//

#import "UserDefaultsUtils.h"

@implementation UserDefaultsUtils

+ (id)objectForKey:(NSString *)defaultName {
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}

+ (void)setObject:(id)value forKey:(NSString *)defaultName {
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)removeObjectForKey:(NSString *)defaultName {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)boolForKey:(NSString *)defaultName {
    return [[NSUserDefaults standardUserDefaults] boolForKey:defaultName];
}

+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName {
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)print {
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults] dictionaryRepresentation]);
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////
+ (void)setCustomObject:(id)anObject forKey:(NSString *)aKey {
    NSData *anObjectData = [NSKeyedArchiver archivedDataWithRootObject:anObject];
    [[NSUserDefaults standardUserDefaults] setObject:anObjectData forKey:aKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id)customObjectForKey:(NSString *)aKey {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *anObjectData = [defaults objectForKey:aKey];
    return [NSKeyedUnarchiver unarchiveObjectWithData:anObjectData];
}

@end
