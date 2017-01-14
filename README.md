# NSObject+NSLog

[![CI Status](http://img.shields.io/travis/0x5e/NSObject-NSLog.svg?style=flat)](https://travis-ci.org/0x5e/NSObject-NSLog)
[![Version](https://img.shields.io/cocoapods/v/NSObject+NSLog.svg?style=flat)](http://cocoapods.org/pods/NSObject+NSLog)
[![License](https://img.shields.io/cocoapods/l/NSObject+NSLog.svg?style=flat)](http://cocoapods.org/pods/NSObject+NSLog)
[![Platform](https://img.shields.io/cocoapods/p/NSObject+NSLog.svg?style=flat)](http://cocoapods.org/pods/NSObject+NSLog)

A simple drop-in library to support `NSDictionary/NSArray/NSSet` unicode encoding output when using NSLog(@"%@", dict);

## Features

- Support unicode character
- Nested indent
- `DEBUG` macro
- Unit test
- Travis-ci
- Boundary treatment
- Eliminate ambiguity

## Reference

[swift-corelibs-foundation](https://github.com/apple/swift-corelibs-foundation/)

## Requirements

NSObject+NSLog require iOS 7.0+ or macOS 10.9+.

## Installation

NSObject+NSLog is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "NSObject+NSLog"
```

## Example

Empty directory:

```
NSDictionary *dict = @{};
NSLog(@"%@", dict);

// output
2017-01-14 21:16:32.573974 xctest[53279:9350242] {
    "dict" = {};
}

```

Nested indent directory:

```
NSDictionary *dict = @{@"dict": @{@"dict2": @{@"key": @"value"}}};
NSLog(@"%@", dict);

// output
2017-01-14 21:16:32.574952 xctest[53279:9350242] {
    "dict" = {
        "dict2" = {
            "key" = "value";
        };
    };
}

```

Numbers:

```
NSDictionary *dict = @{@"number": @(0)};
NSLog(@"%@", dict);
    
NSDictionary *dict2 = @{@"number": @(0.1)};
NSLog(@"%@", dict2);
    
NSDictionary *dict3 = @{@"number": @(-2.2)};
NSLog(@"%@", dict3);

// output
2017-01-14 21:16:32.572450 xctest[53279:9350242] {
    "number" = 0;
}
2017-01-14 21:16:32.572555 xctest[53279:9350242] {
    "number" = 0.1;
}
2017-01-14 21:16:32.572618 xctest[53279:9350242] {
    "number" = -2.2;
}
```

Unicode:

```
NSDictionary *dict = @{@"emoji": @"🐒🐔🐶🐷"};
NSLog(@"%@", dict);

NSDictionary *dict2 = @{@"chinese": @"中文"};
NSLog(@"%@", dict2);

// output
2017-01-14 21:16:32.577841 xctest[53279:9350242] {
    "emoji" = "🐒🐔🐶🐷";
}
2017-01-14 21:16:32.577890 xctest[53279:9350242] {
    "chinese" = "中文";
}
```

## Author

gaosen, 0x5e@sina.cn

## License

NSObject+NSLog is available under the MIT license. See the LICENSE file for more info.

## TODO

- NSString escape（[CFString​Transform](http://nshipster.cn/cfstringtransform/)）
- NSDictionary、NSSet print before sort
- More unit test case
