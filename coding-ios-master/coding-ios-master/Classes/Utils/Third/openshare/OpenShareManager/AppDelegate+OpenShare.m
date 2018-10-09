//
//  AppDelegate+OpenShare.m
//  ZhongLv
//
//  Created by MAC on 2018/5/11.
//  Copyright © 2018年 Zhonglv. All rights reserved.
//

#import "AppDelegate+OpenShare.h"
#import "OpenShareHeader.h"
#import "OpenShare.h"

@implementation AppDelegate (OpenShare)

/// 初始化各个平台
- (void)openShareConnectPlatform {
    // QQ
    [OpenShare connectQQWithAppId:kQQAppId];
    // 微信
    [OpenShare connectWeixinWithAppId:kWXAppId];
    // 微博
    [OpenShare connectWeiboWithAppKey:kWeiboAppId];
}
/// OpenShare 是否能够处理此事件
- (BOOL)openShare:(UIApplication *)application openURL:(NSURL *)url {
    // OpenShare
    if ([OpenShare handleOpenURL:url]) {
        return YES;
    }
    return NO;
}

@end
