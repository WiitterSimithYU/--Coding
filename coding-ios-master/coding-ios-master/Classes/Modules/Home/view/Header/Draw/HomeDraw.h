//
//  HomeDraw.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/8.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"
#import "HomePushButton.h"

#pragma mark - 代理
@class HomeDraw;
@protocol HomeDrawDelegate<NSObject>

@optional
/// 点击了内三角形
- (void)homeDraw:(HomeDraw *)draw didClickInTriangle:(CAShapeLayer *)triangle;
/// 点击了三个按钮
- (void)homeDraw:(HomeDraw *)draw didTapButton:(HomePushButton *)speed;
/// 点击速率按钮
- (void)homeDraw:(HomeDraw *)draw didTapSpeed:(UIButton *)speed;
/// 点击控制按钮
- (void)homeDraw:(HomeDraw *)draw didTapControl:(UIButton *)control;

@end

#pragma mark - 声明
@interface HomeDraw : BaseView

/// 代理
@property (nonatomic, weak  ) id<HomeDrawDelegate> delegate;

@property (nonatomic, assign) CGFloat value1;
@property (nonatomic, assign) CGFloat value2;
@property (nonatomic, assign) CGFloat value3;

@end
