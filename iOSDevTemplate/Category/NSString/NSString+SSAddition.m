//
//  NSString+SSAddition.m
//  iOSDevTemplate
//
//  Created by zhucuirong on 15/7/9.
//  Copyright (c) 2015年 SINOFAKE SINEP. All rights reserved.
//

#import "NSString+SSAddition.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (SSAddition)

- (BOOL)ss_containsString:(NSString *)string {
    return !NSEqualRanges([self rangeOfString:string], NSMakeRange(NSNotFound, 0));
}

- (NSString *)ss_md5 {
    if(self == nil || [self length] == 0)
        return nil;
    
    const char *value = [self UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (CC_LONG)strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    
    return outputString;
}

- (NSString *)reversedString {
    NSMutableString *reverseString = [[NSMutableString alloc] init];
    NSInteger charIndex = [self length];
    while (charIndex > 0) {
        charIndex --;
        NSRange subStrRange = NSMakeRange(charIndex, 1);
        [reverseString appendString:[self substringWithRange:subStrRange]];
    }
    return reverseString;
}

- (NSString *)trimmingWhitespace {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)trimmingWhitespaceAndNewlines {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

//Unicode编码的字符串转成NSString
- (NSString *)makeUnicodeToString {
    NSString *tempStr1 = [self stringByReplacingOccurrencesOfString:@"\\u"withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""];
    NSString *tempStr3 = [[@"\""stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    //NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData mutabilityOption:NSPropertyListImmutable format:NULL errorDescription:NULL];
    
    NSString *returnStr = [NSPropertyListSerialization propertyListWithData:tempData options:NSPropertyListMutableContainersAndLeaves format:NULL error:NULL];
    
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n"withString:@"\n"];
}

- (NSString *)capitalizedSentence {
    return [self stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[self substringToIndex:1] capitalizedString]];
}

- (NSInteger)numberOfLineBreaks {
    NSInteger numberOfBreaks = [self componentsSeparatedByString:@"\n"].count;
    if (numberOfBreaks > 1) return numberOfBreaks-1;
    else return 0;
}

- (NSString *)stringByStrippingHTML {
    return [self stringByReplacingOccurrencesOfString:@"<[^>]+>" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, self.length)];
}

- (NSString *)stringByRemovingScriptsAndStrippingHTML {
    NSMutableString *mString = [self mutableCopy];
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<script[^>]*>[\\w\\W]*</script>" options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *matches = [regex matchesInString:mString options:NSMatchingReportProgress range:NSMakeRange(0, [mString length])];
    for (NSTextCheckingResult *match in [matches reverseObjectEnumerator]) {
        [mString replaceCharactersInRange:match.range withString:@""];
    }
    return [mString stringByStrippingHTML];
}

#pragma mark - Working with Ranges

- (NSRange)ss_composedRangeWithRange:(NSRange)range {
    // We're going to make a new range that takes into account surrogate unicode pairs (composed characters)
    __block NSRange adjustedRange = NSMakeRange(range.location, range.length);
    NSUInteger length = self.length;
    
    // Adjust range location for composed characters that appear before the original range.
    [self enumerateSubstringsInRange:NSMakeRange(0, length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        // Stop if we've past the end of the range to be adjusted
        if (substringRange.location >= adjustedRange.location) {
            *stop = YES;
            return;
        }
        
        adjustedRange.location += (substringRange.length - 1);
    }];
    
    // Adjust range length for composed characters that appear within the original range.
    [self enumerateSubstringsInRange:NSMakeRange(adjustedRange.location, length - adjustedRange.location) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        adjustedRange.length += (substringRange.length - 1);
        
        // Stop if we're finished
        if (NSMaxRange(substringRange) >= NSMaxRange(adjustedRange)) {
            *stop = YES;
        }
    }];
    
    // Return the adjusted range
    return adjustedRange;
}


- (NSString *)ss_composedSubstringWithRange:(NSRange)range {
    // Return a substring using a composed range so surrogate unicode pairs (composed characters) count as 1 in the
    // range instead of however many unichars they actually are.
    return [self substringWithRange:[self ss_composedRangeWithRange:range]];
}


- (NSRange)ss_wordRangeAtIndex:(NSUInteger)index {
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceCharacterSet];
    NSInteger beginIndex = index;
    while(beginIndex > 0 && ![whitespace characterIsMember:[self characterAtIndex:beginIndex - 1]]) {
        beginIndex--;
    }
    
    NSInteger endIndex = index;
    NSInteger lenght = [self length];
    while (endIndex < lenght && ![whitespace characterIsMember:[self characterAtIndex:endIndex]]) {
        endIndex++;
    }
    return NSMakeRange(beginIndex, endIndex - beginIndex);
}


@end
