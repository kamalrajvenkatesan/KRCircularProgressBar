#
# Be sure to run `pod lib lint KRCircularProgressBar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KRCircularProgressBar'
  s.version          = '0.1.0'
  s.summary          = 'Circular progress bar for iOS applications.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Circular progress bar for iOS applications. Drag and drop a UIView and change the class name to KRCircularProgressBar in view's Identity Inspector
                       DESC

  s.homepage         = 'https://github.com/kamalrajvenkatesan/KRCircularProgressBar'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kamalraj venkatesan' => 'kamalrajv3@gmail.com' }
  s.source           = { :git => 'https://github.com/kamalrajvenkatesan/KRCircularProgressBar.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.swift_version = '4.0'

  s.source_files = 'KRCircularProgressBar/Classes/**/*'
  
  # s.resource_bundles = {
  #   'KRCircularProgressBar' => ['KRCircularProgressBar/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
