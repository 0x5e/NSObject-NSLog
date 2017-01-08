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
    
    array = @[@"emoji", @"☺️"];
    XCTAssert([array.description isEqualToString:@"[\n    \"emoji\",\n    \"☺️\",\n]"]);
    
    array = @[@"chinese", @"中文"];
    XCTAssert([array.description isEqualToString:@"[\n    \"chinese\",\n    \"中文\",\n]"]);
}

@end
