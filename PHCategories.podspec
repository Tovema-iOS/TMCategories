#
# Be sure to run `pod lib lint PHCategories.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "PHCategories"
  s.version          = "0.1.6"
  s.summary          = "常用类别"

  s.description      = "常用类别库"

  s.homepage         = "http://git.felink.com:3000/felink-iOS/FLCategories"
  s.license          = 'MIT'
  s.author           = { "linxiaobin" => "linxiaobin@felink.com" }
  s.source           = { :git => "http://git.felink.com:3000/felink-iOS/FLCategories.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = false

  s.source_files = 'Pod/Classes/PHCategories/**/*'
  
  s.dependency 'FLCategories', '~> 1.0'
  s.dependency 'FTAnimation', '~> 1.0'
end
