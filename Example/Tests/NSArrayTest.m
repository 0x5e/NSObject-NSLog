//
//  NSArrayTest.m
//  NSObject+NSLog
//
//  Created by 高森 on 2017/1/8.
//  Copyright © 2017年 0x5e. All rights reserved.
//

#import "NSArrayTest.h"

@implementation NSArrayTest

- (void)testUnicode {
    NSArray *array;
    NSString *log;
    
    array = @[@"emoji", @"☺️"];
    log = @"[\n    \"emoji\",\n    \"☺️\",\n]";
    NSLog(@"%@", array);
    XCTAssert([array.description isEqualToString:log]);
    
    array = @[@"chinese", @"中文"];
    log = @"[\n    \"chinese\",\n    \"中文\",\n]";
    NSLog(@"%@", array);
    XCTAssert([array.description isEqualToString:log]);
}

@end
