//
//  NIMAVChatServerSetting.h
//  NIMAVChat
//
//  Created by Simon Blue on 2018/6/12.
//  Copyright © 2018年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 音视频服务器地址
 */
@interface NIMAVChatServerSetting : NSObject

/**
 * NRTC 服务器地址
 */
@property (nonatomic, copy)NSString *nrtcServerAddress;

/**
 * RoomServer 地址
 */
@property (nonatomic, copy)NSString *roomServerAddress;

/**
 * 统计 服务器地址
 */
@property (nonatomic, copy)NSString *statisticsAddress;

/**
 * 功能统计 服务器地址
 */
@property (nonatomic, copy)NSString *eventTrackAddress;

/**
 * 兼容性配置 服务器地址
 */
@property (nonatomic, copy)NSString *compatConfigAddress;

/**
 * 音频信息 服务器地址
 */
@property (nonatomic, copy)NSString *audioInfoAddress;

/**
 * 通用上报 服务器地址
 */
@property (nonatomic, copy)NSString *commonReportAddress;

/**
 * NOS token 请求地址
 */
@property (nonatomic, copy)NSString *nosTokenAddress;

/**
 * NOS 服务器 lbs 地址
 */
@property (nonatomic,copy)NSString *nosLbsAddress;

/**
 *  NOS 上传服务器默认地址
 */
@property (nonatomic,copy)NSString *nosUploadAddress;

/**
* 从配置数据更新
*/
- (void)updateSettingFromConfigData:(NSData *)data;

@end
