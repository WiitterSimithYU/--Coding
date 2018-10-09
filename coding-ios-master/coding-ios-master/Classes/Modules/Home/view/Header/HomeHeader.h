//
//  HomeHeader.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/7.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"
#import "HomePushButton.h"
#import "HomeHeaderBg.h"

#pragma mark - 代理
@class HomeHeader;
@protocol HomeHeaderDelegate<NSObject>

@optional
/// 点击内三角
- (void)homeHeader:(HomeHeader *)header didClickInTriangle:(CAShapeLayer *)triangle;
/// 点击了三个按钮
- (void)homeHeader:(HomeHeader *)header didTapButton:(HomePushButton *)button;
/// 点击速率按钮
- (void)homeHeader:(HomeHeader *)header didTapSpeed:(UIButton *)speed;
/// 点击控制按钮
- (void)homeHeader:(HomeHeader *)header didTapControl:(UIButton *)control;
/// 点击了关闭按钮
- (void)homeHeader:(HomeHeader *)header didTapClose:(UIButton *)close;
/// 点击音量调节
- (void)homeHeader:(HomeHeader *)header didClickMusic:(UIButton *)music;

@end

#pragma mark - 声明
@interface HomeHeader : BaseView

/// 代理
@property (nonatomic, weak  ) id<HomeHeaderDelegate> delegate;
/// 背景色
@property (nonatomic, strong) UIColor *bgColor;
/// 填充样式
@property (nonatomic, assign) HomeHeaderBgType type;

@end
