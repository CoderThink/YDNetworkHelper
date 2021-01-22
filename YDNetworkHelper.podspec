#
# Be sure to run `pod lib lint YDNetworkHelper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YDNetworkHelper'
  s.version          = '0.1.0'
  s.summary          = 'YDNetworkHelper.'

  s.description      = 'AFNetworking 与YYCache封装,一句代码搞定数据请求与缓存,告别FMDB!控制台直接打印json中文字符,调试更方便.'

  s.homepage         = 'https://github.com/CoderThink/YDNetworkHelper'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yangdong@163.com' => 'yangdong@163.com' }
  s.source           = { :git => 'https://github.com/CoderThink/YDNetworkHelper.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'YDNetworkHelper/Classes/**/*'
  
  # s.resource_bundles = {
  #   'YDNetworkHelper' => ['YDNetworkHelper/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.dependency 'AFNetworking'
   s.dependency 'YYCache'
   s.requires_arc = true
   
end
