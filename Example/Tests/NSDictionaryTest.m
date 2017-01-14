//
//  NSDictionaryTest.m
//  NSObject+NSLog
//
//  Created by 高森 on 2017/1/8.
//  Copyright © 2017年 0x5e. All rights reserved.
//

#import "NSDictionaryTest.h"

@implementation NSDictionaryTest

- (void)testEmpty {
    NSDictionary *dict = @{};
    NSString *log = @"{}";
    NSLog(@"%@", dict);
    XCTAssert([dict.description isEqualToString:log]);
}

- (void)testIndent {
    NSDictionary *dict = @{@"key": @"value"};
    NSString *log = @"{\n    \"key\" = \"value\";\n}";
    NSLog(@"%@", dict);
    XCTAssert([dict.description isEqualToString:log]);
}

- (void)testNestedIndent {
    NSDictionary *dict;
    NSString *log;
    
    dict = @{@"dict": @{}};
    log = @"{\n    \"dict\" = {};\n}";
    NSLog(@"%@", dict);
    XCTAssert([dict.description isEqualToString:log]);
    
    dict = @{@"dict": @{@"key": @"value"}};
    log = @"{\n    \"dict\" = {\n        \"key\" = \"value\";\n    };\n}";
    NSLog(@"%@", dict);
    XCTAssert([dict.description isEqualToString:log]);
    
    dict = @{@"dict": @{@"dict2": @{@"key": @"value"}}};
    log = @"{\n    \"dict\" = {\n        \"dict2\" = {\n            \"key\" = \"value\";\n        };\n    };\n}";
    NSLog(@"%@", dict);
    XCTAssert([dict.description isEqualToString:log]);
}

- (void)testMultiObject {
    NSDictionary *dict = @{@"a": @"A", @"b": @"B", @"c": @"C"};
    NSString *log = @"{\n    \"a\" = \"A\";\n    \"b\" = \"B\";\n    \"c\" = \"C\";\n}";
    NSLog(@"%@", dict);
    XCTAssert([dict.description isEqualToString:log]);
}

- (void)testNullObject {
    NSDictionary *dict = @{@"null": [NSNull null]};
    NSString *log = @"{\n    \"null\" = <null>;\n}";
    NSLog(@"%@", dict);
    XCTAssert([dict.description isEqualToString:log]);
}

- (void)testOtherObject {
    NSObject *object = [NSObject new];
    NSDictionary *dict = @{@"object": object};
    NSString *log = [NSString stringWithFormat:@"{\n    \"object\" = <%@: %p>;\n}", NSStringFromClass(object.class), object];
    NSLog(@"%@", dict);
    XCTAssert([dict.description isEqualToString:log]);
}

- (void)testNumber {
    NSDictionary *dict;
    NSString *log;
    
    dict = @{@"number": @(0)};
    log = @"{\n    \"number\" = 0;\n}";
    NSLog(@"%@", dict);
    XCTAssert([dict.description isEqualToString:log]);
    
    dict = @{@"number": @(0.1)};
    log = @"{\n    \"number\" = 0.1;\n}";
    NSLog(@"%@", dict);
    XCTAssert([dict.description isEqualToString:log]);
    
    dict = @{@"number": @(-2.2)};
    log = @"{\n    \"number\" = -2.2;\n}";
    NSLog(@"%@", dict);
    XCTAssert([dict.description isEqualToString:log]);
    
    dict = @{@(3.3): @"number"};
    log = @"{\n    3.3 = \"number\";\n}";
    NSLog(@"%@", dict);
    XCTAssert([dict.description isEqualToString:log]);
}

- (void)testUnicode {
    NSDictionary *dict;
    NSString *log;
    
    dict = @{@"emoji": @"🐒🐔🐶🐷"};
    log = @"{\n    \"emoji\" = \"🐒🐔🐶🐷\";\n}";
    NSLog(@"%@", dict);
    XCTAssert([dict.description isEqualToString:log]);

    dict = @{@"chinese": @"中文"};
    log = @"{\n    \"chinese\" = \"中文\";\n}";
    NSLog(@"%@", dict);
    XCTAssert([dict.description isEqualToString:log]);
    
    dict = @{@"符号": @"āáǎà①②③④🀀🀂🀁🀃"};
    log = @"{\n    \"符号\" = \"āáǎà①②③④🀀🀂🀁🀃\";\n}";
    NSLog(@"%@", dict);
    XCTAssert([dict.description isEqualToString:log]);
}

@end
