Pod::Spec.new do |s|
  s.name         = 'KKCategory'
  s.summary      = 'Cocoa Touch all category.'
  s.version      = '1.0.0'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { '观剑不则声' => 'yoon1583@foxmail.com' }
  s.social_media_url = 'http://yoon.farbox.com/'
  s.homepage     = 'https://github.com/sugarAndsugar/KKCategory'
  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.source       = { :git => 'https://github.com/sugarAndsugar/KKCategory.git', :tag => s.version.to_s }
  
  s.requires_arc = true
  s.source_files = 'KKCategory/**/*.{h,m}'
  #s.resource     = 'KKCategory/UIKit/Support/KIInputSource.bundle'

  s.frameworks = 'UIKit', 'Foundation'

end