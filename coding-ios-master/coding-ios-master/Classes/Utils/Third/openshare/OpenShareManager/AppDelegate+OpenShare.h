//
//  AppDelegate+OpenShare.h
//  ZhongLv
//
//  Created by MAC on 2018/5/11.
//  Copyright © 2018年 Zhonglv. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (OpenShare)

/// 初始化平台
- (void)openShareConnectPlatform;
/// OpenShare 是否能够处理此事件
- (BOOL)openShare:(UIApplication *)application openURL:(NSURL *)url;

@end
