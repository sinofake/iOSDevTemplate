//
//  PathUtils.h
//  iOSDevTemplate
//
//  Created by zhucuirong on 15/7/7.
//  Copyright (c) 2015年 SINOFAKE SINEP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManagerUtils : NSObject

//eg:file:///var/mobile/Containers/Data/Application/E1957A70-1702-483D-9FDA-E15AC7E7CF6F/Documents/
+ (NSURL *)documentsURL;

//eg:/var/mobile/Containers/Data/Application/E1957A70-1702-483D-9FDA-E15AC7E7CF6F/Documents
+ (NSString *)documentsPath;

//eg:file:///var/mobile/Containers/Data/Application/E1957A70-1702-483D-9FDA-E15AC7E7CF6F/Library/
+ (NSURL *)libraryURL;

//eg:/var/mobile/Containers/Data/Application/E1957A70-1702-483D-9FDA-E15AC7E7CF6F/Library
+ (NSString *)libraryPath;

//eg:file:///var/mobile/Containers/Data/Application/E1957A70-1702-483D-9FDA-E15AC7E7CF6F/Library/Caches/
+ (NSURL *)cachesURL;

//eg:/var/mobile/Containers/Data/Application/E1957A70-1702-483D-9FDA-E15AC7E7CF6F/Library/Caches
+ (NSString *)cachesPath;

/**
 Adds a special filesystem flag to a file to avoid iCloud backup it.
 
 @param path Path to a file to set an attribute.
 */
+ (BOOL)addSkipBackupAttributeToFile:(NSString *)path;

/**
 Get available disk space.
 
 @return An amount of available disk space in Megabytes.
 该值除以 1024 即可得到手机可用的存储空间（单位：G）
 */
+ (double)availableDiskSpace;

@end
