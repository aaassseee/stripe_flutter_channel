#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'stripe_flutter_channel'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter project.'
  s.description      = <<-DESC
Integration between Stripe payment gateway and flutter using native library iOS and Android
                       DESC
  s.homepage         = 'https://github.com/aaassseee/stripe_flutter_channel'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'aaassseee' => 'ywp033319@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'Stripe'

  s.ios.deployment_target = '8.0'
end

