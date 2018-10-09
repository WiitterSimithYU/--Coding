//
//  HomeHeaderSlider.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/10.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"

#pragma mark - 代理
@class HomeHeaderSlider;
@protocol HomeHeaderSliderDelegate<NSObject>

@optional
// 值改变了
- (void)headerSlider:(HomeHeaderSlider *)slider valueDidChange:(CGFloat)percentage;

@end

#pragma mark - 声明
@interface HomeHeaderSlider : BaseView

// 代理
@property (nonatomic, weak  ) id<HomeHeaderSliderDelegate> delegate;
// 滑条
@property (nonatomic, strong) UISlider *slider;

- (void)show:(CGFloat)alpha;

@end
