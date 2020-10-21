#
# Be sure to run `pod lib lint MmmmKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MmmmKit'
  s.version          = '1.0.0'
  s.summary          = 'For test.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
     maybe can help you
                       DESC

  s.homepage         = 'https://github.com/IrisMo/MmmmKit.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'irisMo' => 'iris_momo@126.com' }
  s.source           = { :https://github.com/IrisMo/MmmmKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'MmmmKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MmmmKit' => ['MmmmKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
 s.vendored_frameworks = 'MmmmKit/*.{framework}'

end
