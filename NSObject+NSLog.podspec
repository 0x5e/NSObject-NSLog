#
# Be sure to run `pod lib lint NSObject+NSLog.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NSObject+NSLog'
  s.version          = '1.0.0'
  s.summary          = 'A simple drop-in library to support `NSDictionary/NSArray/NSSet` unicode encoding output when using NSLog(@"%@", dict);'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'As we know, when print `NSDictionary/NSArray/NSSet` with `NSLog`, non-ascii characers will be convert to `\\Uxxxx` format. Let me revert back:)'

  s.homepage         = 'https://github.com/0x5e/NSObject-NSLog'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gaosen' => '0x5e@sina.cn' }
  s.source           = { :git => 'https://github.com/0x5e/NSObject-NSLog.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'

  s.source_files = 'NSObject+NSLog/Classes/**/*'
  
  s.framework = 'Foundation'

end
