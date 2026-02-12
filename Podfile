platform :ios, '16.0'

use_frameworks! :linkage => :static

target 'HifyLive' do
  # 阿里云 OSS iOS SDK 最新版本
  pod 'AliyunOSSiOS', '~> 2.11.2'

   # 音视频直播（声网）
  pod 'AgoraRtcEngine_iOS', :subspecs => ['RtcBasic']

  # 即时通讯 / 聊天室（云信）
  pod 'NIMSDK'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      # 设置最小 iOS 版本
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '16.0'

      # 开启死代码剔除
      config.build_settings['DEAD_CODE_STRIPPING'] = 'YES'
      config.build_settings['COPY_PHASE_STRIP'] = 'YES'
      config.build_settings['STRIP_INSTALLED_PRODUCT'] = 'YES'

      # Swift 优化等级
      if config.name == 'Release'
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
      else
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Onone'
      end
    end
  end
end
