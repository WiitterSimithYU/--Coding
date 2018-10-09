//
//  HomePushButton.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/9.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"
#import "UIButton+HomeAnimation.h"
#import "BaseView+HomeHeader.h"

#pragma mark - 代理
@class HomePushButton;
@protocol HomePushButtonDelegate<NSObject>

@optional
// 点击
- (void)pushButtonDidTap:(HomePushButton *)button;
// 点击速率按钮
- (void)pushButton:(HomePushButton *)button didTapSpeed:(UIButton *)speed;
// 点击控制按钮
- (void)pushButton:(HomePushButton *)button didTapControl:(UIButton *)control;

@end

#pragma mark - 声明
@interface HomePushButton : BaseView

@property (nonatomic, weak  ) id<HomePushButtonDelegate> delegate;
@property (nonatomic, assign) HomePushButtonTriangle type;

- (void)show;
- (void)hide;

@end

