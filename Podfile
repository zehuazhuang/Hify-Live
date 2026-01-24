platform :ios, '16.0'

use_frameworks!

target 'HifyLive' do
  # 阿里云 OSS iOS SDK 最新版本
  pod 'AliyunOSSiOS', '~> 2.11.2'

   # 音视频直播（声网）
  pod 'AgoraRtcEngine_iOS'

  # 即时通讯 / 聊天室（云信）
  pod 'NIMSDK'



end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '16.0'
    end
  end
end