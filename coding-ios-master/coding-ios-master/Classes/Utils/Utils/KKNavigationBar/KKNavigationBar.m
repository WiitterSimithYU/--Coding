//
//  KKNavigationBar.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/15.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "KKNavigationBar.h"

#pragma mark - 声明
@interface KKNavigationBar ()

@property (nonatomic, strong) UIView *bg;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UIButton *last;
@property (nonatomic, strong) UIButton *next;

@end

#pragma mark - 实现
@implementation KKNavigationBar

#pragma mark - 初始化
+ (instancetype)init {
    KKNavigationBar *view = [KKNavigationBar loadCode:CGRectMake(0, 0, ScreenWidth, NavigationBarHeight)];
    [view createView];
    return view;
}
- (void)createView {
    [self bg];
    [self name];
    [self last];
    [self next];
}
- (UIView *)bg {
    if (!_bg) {
        _bg = [[UIView alloc] initWithFrame:self.bounds];
        _bg.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
        [self addSubview:_bg];
    }
    return _bg;
}
- (UILabel *)name {
    if (!_name) {
        _name = [[UILabel alloc] initWithFrame:CGRectMake(0, StatusBarHeight, ScreenWidth / 2, self.height - StatusBarHeight)];
        _name.centerX = self.centerX;
        _name.backgroundColor = [UIColor orangeColor];
        _name.text = @"123123";
        _name.textColor = [UIColor whiteColor];
        _name.font = [UIFont boldSystemFontOfSize:adjustFont(16)];
        _name.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_name];
    }
    return _name;
}
- (UIButton *)last {
    if (!_last) {
        _last = [UIButton buttonWithType:UIButtonTypeCustom];
        _last.frame = ({
            CGFloat width = 30;
            CGFloat height = width;
            CGFloat left = 10;
            CGFloat top = ((self.height - StatusBarHeight) - height) / 2 + StatusBarHeight;
            CGRectMake(left, top, width, height);
        });
        _last.backgroundColor = [UIColor orangeColor];
        [self addSubview:_last];
    }
    return _last;
}
- (UIButton *)next {
    if (!_next) {
        _next = [UIButton buttonWithType:UIButtonTypeCustom];
        _next.frame = ({
            CGFloat width = 30;
            CGFloat height = width;
            CGFloat left = ScreenWidth - 10 - width;
            CGFloat top = ((self.height - StatusBarHeight) - height) / 2 + StatusBarHeight;
            CGRectMake(left, top, width, height);
        });
        _next.backgroundColor = [UIColor orangeColor];
        [self addSubview:_next];
    }
    return _next;
}

#pragma mark - 动画
- (void)show {
    [UIView animateWithDuration:.5f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.top = 0;
    } completion:^(BOOL finished) {
        
    }];
}
- (void)hide {
    [UIView animateWithDuration:.5f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.top = -self.height;
    } completion:^(BOOL finished) {
        
    }];
}
- (void)setBackgroundColor:(UIColor *)backgroundColor {
    _bg.backgroundColor = backgroundColor;
}

@end
