//
//  NSObject+NSLog.m
//  NSObject+NSLog
//
//  Created by 高森 on 2017/1/7.
//  Copyright © 2017年 0x5e. All rights reserved.
//
//  参考swift-corelibs-foundation实现
//  https://github.com/apple/swift-corelibs-foundation/

//#define DEBUG 0

#if DEBUG

@import Foundation;

NSString *description(id obj, NSLocale *locale, NSUInteger indent) {
    if ([obj respondsToSelector:@selector(descriptionWithLocale:indent:)]) {
        return [obj descriptionWithLocale:locale indent:indent];
    } else if ([obj isKindOfClass:NSString.class]) {
        return [NSString stringWithFormat:@"\"%@\"", obj];
    } else {
        return [NSString stringWithFormat:@"%@", obj];
    }
}

@implementation NSDictionary (NSLog)

- (NSString *)descriptionWithLocale:(NSLocale *)locale indent:(NSUInteger)level {
    if (level > 100) {
        return @"...";
    }
    
    NSMutableArray *lines = [NSMutableArray array];
    
    [lines addObject:@"{"];
    [self enumerateKeysAndObjectsUsingBlock:^(id  key, id obj, BOOL *stop) {
        NSString *strKey = description(key, locale, level + 1);
        NSString *strObj = description(obj, locale, level + 1);
        NSString *line = [NSString stringWithFormat:@"    %@ = %@;", strKey, strObj];
        [lines addObject:line];
    }];
    [lines addObject:@"}"];
    
    NSMutableString *indentation = [NSMutableString string];
    if (self.count > 0) {
        [indentation appendString:@"\n"];
        for (int i = 0; i < level; i++) {
            [indentation appendString:@"    "];
        }
    }
    
    return [lines componentsJoinedByString:indentation];
}

@end

@implementation NSArray (NSLog)

- (NSString *)descriptionWithLocale:(NSLocale *)locale indent:(NSUInteger)level {
    if (level > 100) {
        return @"...";
    }
    
    NSMutableArray *lines = [NSMutableArray array];
    
    [lines addObject:@"["];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *strObj = description(obj, locale, level + 1);
        NSString *line = [NSString stringWithFormat:@"    %@,", strObj];
        [lines addObject:line];
    }];
    [lines addObject:@"]"];
    
    NSMutableString *indentation = [NSMutableString string];
    if (self.count > 0) {
        [indentation appendString:@"\n"];
        for (int i = 0; i < level; i++) {
            [indentation appendString:@"    "];
        }
    }
    
    return [lines componentsJoinedByString:indentation];
}

@end

@implementation NSSet (NSLog)

- (NSString *)descriptionWithLocale:(NSLocale *)locale indent:(NSUInteger)level {
    if (level > 100) {
        return @"...";
    }
    
    NSMutableArray *lines = [NSMutableArray array];
    
    [lines addObject:@"("];
    [self enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        NSString *strObj = description(obj, locale, level + 1);
        NSString *line = [NSString stringWithFormat:@"    %@,", strObj];
        [lines addObject:line];
    }];
    [lines addObject:@")"];
    
    NSMutableString *indentation = [NSMutableString string];
    if (self.count > 0) {
        [indentation appendString:@"\n"];
        for (int i = 0; i < level; i++) {
            [indentation appendString:@"    "];
        }
    }
    
    return [lines componentsJoinedByString:indentation];
}

@end

#endif
