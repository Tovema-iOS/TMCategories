#
# Be sure to run `pod lib lint PHCategories.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "TMCategories2"
  s.version          = "1.0.3"
  s.summary          = "常用类别"

  s.description      = "常用类别库"

  s.homepage         = "https://github.com/Tovema-iOS/TMCategories"
  s.license          = 'MIT'
  s.author           = { 'CodingPub' => 'lxb_0605@qq.com' }
  s.source           = { :git => "https://github.com/Tovema-iOS/TMCategories.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
end
