//
//  ShareViewContent.h
//  ZhongLv
//
//  Created by MAC on 2018/5/11.
//  Copyright © 2018年 Zhonglv. All rights reserved.
//

#import "BaseView.h"
#import "OpenShareHeader.h"

#pragma mark - 声明
@interface ShareViewContent : BaseView

// 取消按钮
@property (nonatomic, strong) UIButton *cancle;
// 要分享的东西
@property (nonatomic, strong) OSMessage *message;

+ (instancetype)initWithFrame:(CGRect)frame;

@end
