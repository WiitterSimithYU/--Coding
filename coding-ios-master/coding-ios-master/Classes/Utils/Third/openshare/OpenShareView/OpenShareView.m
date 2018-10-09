//
//  OpenShareView.m
//  ZhongLv
//
//  Created by MAC on 2018/5/11.
//  Copyright © 2018年 Zhonglv. All rights reserved.
//

#import "OpenShareView.h"

#pragma mark - 声明
@interface OpenShareView ()

@property (nonatomic, strong) UIButton *shadow;

@end

#pragma mark - 实现
@implementation OpenShareView

#pragma mark - 初始化
+ (instancetype)init {
    OpenShareView *view = [[OpenShareView alloc] initWithFrame:ScreenBounds];
    [view createView];
    return view;
}
- (void)createView {
    [self setBackgroundColor:[UIColor clearColor]];
    [self shadow];
}
- (UIButton *)shadow {
    if (!_shadow) {
        _shadow = [UIButton buttonWithType:UIButtonTypeCustom];
        _shadow.frame = self.bounds;
        _shadow.backgroundColor = [UIColor whiteColor];
        _shadow.alpha = 0;
        [_shadow addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_shadow];
    }
    return _shadow;
}

#pragma mark - 设置
- (void)setMessage:(OSMessage *)message {
    _message = message;
}

#pragma mark - 动画
- (void)show {
    [self setHidden:NO];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:.3f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _shadow.alpha = 0.3;
    } completion:^(BOOL finished) {
        
    }];
}
- (void)hide {
    [UIView animateWithDuration:.3f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _shadow.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [self setHidden:YES];
    }];
}

@end
