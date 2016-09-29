# Uncomment this line to define a global platform for your project
# platform :ios, '8.0'
# Uncomment this line if you're using Swift
# use_frameworks!

platform :ios, ‘8.0’
use_frameworks!

target ‘PropertyExchange’ do

pod 'AFNetworking', '~> 3.1.0'
pod 'YYKit', '~> 1.0.9'
pod 'MMDrawerController', '~> 0.6.0'
pod 'Masonry', '~> 0.6.3'

pod 'Fabric', '~> 1.6.9'
pod 'Crashlytics', '~> 3.8.2'

pod 'pop', '~> 1.0.9'
pod 'SwiftyJSON', '~> 3.1.0'
pod 'SnapKit', '~> 3.0'

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
end

target 'PropertyExchangeTests' do

end

target 'PropertyExchangeUITests' do

end

