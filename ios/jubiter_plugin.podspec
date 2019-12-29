#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'jubiter_plugin'
  s.version          = '0.0.1'
  s.summary          = 'JuBiter wallet plugin.'
  s.description      = <<-DESC
JuBiter wallet plugin.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'SwiftProtobuf', '~> 1.7'
  s.framework = 'CoreBluetooth'
  s.vendored_frameworks =  'JubSDKCore.framework'
  s.ios.vendored_frameworks = 'gen/JubSDKCore.framework'
  s.xcconfig = { 'OTHER_LDFLAGS' => '-framework JubSDKCore' }

  s.ios.deployment_target = '8.0'
end

