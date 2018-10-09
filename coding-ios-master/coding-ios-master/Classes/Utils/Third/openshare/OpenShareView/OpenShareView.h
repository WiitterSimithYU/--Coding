//
//  OpenShareView.h
//  ZhongLv
//
//  Created by MAC on 2018/5/11.
//  Copyright © 2018年 Zhonglv. All rights reserved.
//

#import "BaseView.h"
#import "OpenShareHeader.h"

#pragma mark - 声明
/// 分享界面
@interface OpenShareView : BaseView

// 要分享的东西
@property (nonatomic, strong) OSMessage *message;

+ (instancetype)init;
- (void)show;
- (void)hide;

/**
 使用方式
 
 OSMessage *msg = [[OSMessage alloc] init];
 msg.title = @"Hello msg.title";
 msg.desc = @"descdescdescdescdescdescdesc";
 msg.link = @"http://www.baidu.com";
 msg.image = [UIImage imageNamed:@"01home_img2"];
 msg.thumbnail = [UIImage imageNamed:@"01home_bar_icon04"];
 
 _aview = [OpenShareView init];
 _aview.message = msg;
 [_aview show];
 
 */

@end
