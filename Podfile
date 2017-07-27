source 'https://github.com/CocoaPods/Specs.git'
platform :ios, ‘8.0’
use_frameworks!

target ’ESDemo’ do

pod 'ESLibrary',:git => 'https://github.com/eruntechsoftware/ESLibrary.git',:tag => '1.0.4'

pod 'RongCloudIM/IMLib', '~> 2.8.3'
pod 'RongCloudIM/IMKit', '~> 2.8.3'

#解决UI设计模式下报错问题
post_install do |installer|
   installer.pods_project.build_configurations.each do |config|
       config.build_settings['LD_RUNPATH_SEARCH_PATHS'] = [
       '$(FRAMEWORK_SEARCH_PATHS)'
       ]
   end
end

end
