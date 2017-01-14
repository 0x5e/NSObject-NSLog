//
//  NSSetTest.m
//  NSObject-NSLog
//
//  Created by 高森 on 2017/1/14.
//  Copyright © 2017年 gaosen. All rights reserved.
//

#import "NSSetTest.h"

@implementation NSSetTest

- (void)testUnicode {
    NSSet *set;
    NSString *log;
    
    set = [NSSet setWithObjects:@"emoji", @"☺️", nil];
    log = @"(\n    \"emoji\",\n    \"☺️\",\n)";
    NSLog(@"%@", set);
    XCTAssert([set.description isEqualToString:log]);
    
    set = [NSSet setWithObjects: @"chinese", @"中文", nil];
    log = @"(\n    \"chinese\",\n    \"中文\",\n)";
    NSLog(@"%@", set);
    XCTAssert([set.description isEqualToString:log]);
}

@end
