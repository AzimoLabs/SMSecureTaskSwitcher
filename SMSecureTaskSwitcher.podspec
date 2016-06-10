#
# Be sure to run `pod lib lint SMSecureTaskSwitcher.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SMSecureTaskSwitcher'
  s.version          = '0.1.0'
  s.summary          = 'Hide data visible in task switcher when your app is in background.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This lib provides the ability to hide data visible in task switcher when your app is in background.
                       DESC

  s.homepage         = 'https://github.com/AzimoLabs/SMSecureTaskSwitcher'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.author           = { 'Mateusz Kuźnik' => 'mateusz.kuznik@azimo.com' }
  s.source           = { :git => 'https://github.com/AzimoLabs/SMSecureTaskSwitcher.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/AzimoLabs'

  s.ios.deployment_target = '7.0'

  s.source_files = 'SMSecureTaskSwitcher/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SMSecureTaskSwitcher' => ['SMSecureTaskSwitcher/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
