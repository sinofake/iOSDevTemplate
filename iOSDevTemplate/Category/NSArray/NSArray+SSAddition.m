//
//  NSArray+SSAddition.m
//  iOSDevTemplate
//
//  Created by zhucuirong on 15/7/9.
//  Copyright (c) 2015年 SINOFAKE SINEP. All rights reserved.
//

#import "NSArray+SSAddition.h"

@implementation NSArray (SSAddition)

- (id)randomObject {
    if ([self count] == 0) {
        return nil;
    }
    return [self objectAtIndex:arc4random_uniform((u_int32_t)[self count])];
}

- (NSArray *)reversedArray {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    for (id element in enumerator) [array addObject:element];
    return array;
}

- (NSArray *)shuffledArray {
    NSMutableArray *array = [self mutableCopy];
    [array shuffle];
    return array;
}

- (NSMutableArray *)deepMutableCopy {
    return (__bridge_transfer NSMutableArray *)CFPropertyListCreateDeepCopy(kCFAllocatorDefault, (__bridge CFArrayRef)self, kCFPropertyListMutableContainers);
}

@end


@implementation NSMutableArray (SAMAdditions)

- (void)shuffle {
    for (NSInteger i = [self count] - 1; i > 0; i--) {
        [self exchangeObjectAtIndex:arc4random_uniform((u_int32_t)i + 1) withObjectAtIndex:i];
    }
}

@end
