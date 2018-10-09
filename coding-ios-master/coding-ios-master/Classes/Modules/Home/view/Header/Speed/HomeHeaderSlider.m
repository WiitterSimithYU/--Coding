//
//  HomeHeaderSlider.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/10.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeHeaderSlider.h"

#pragma mark - 声明
@interface HomeHeaderSlider()

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UIImageView *menu;

@end

#pragma mark - 实现
@implementation HomeHeaderSlider

#pragma mark - 初始化
- (void)initUI {
    [self setHeight:25];
    [self slider];
    [self icon];
    [self menu];
}
- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.frame = CGRectMake(_slider.left - 40, 0, 25, 25);
        _icon.centerY = self.height / 2;
        _icon.image = [UIImage imageNamed:@"灰_包菜"];
        [self addSubview:_icon];
    }
    return _icon;
}
- (UISlider *)slider {
    if (!_slider) {
        _slider = [[UISlider alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth / 2, 20)];
        _slider.centerX = self.centerX;
        _slider.centerY = self.height / 2;
        _slider.minimumTrackTintColor = [UIColor lightTextColor];
        _slider.maximumTrackTintColor = [UIColor lightGrayColor];
        [_slider setThumbImage:[UIImage imageNamed:@"home_circle"] forState:UIControlStateNormal];
        [_slider addTarget:self action:@selector(sliderChange:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_slider];
    }
    return _slider;
}
- (UIImageView *)menu {
    if (!_menu) {
        _menu = [[UIImageView alloc] init];
        _menu.frame = CGRectMake(_slider.right + 20, 0, 25, 25);
        _menu.centerY = self.height / 2;
        _menu.image = [UIImage imageNamed:@"btn_menu_white"];
        [self addSubview:_menu];
    }
    return _menu;
}

#pragma mark - 点击
// 值改变
- (void)sliderChange:(UISlider *)slider {
    if (self.delegate && [self.delegate respondsToSelector:@selector(headerSlider:valueDidChange:)]) {
        [self.delegate headerSlider:self valueDidChange:slider.value];
    }
}

#pragma mark - 设置
- (void)show:(CGFloat)alpha {
    [UIView animateWithDuration:.3f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = alpha;
    } completion:^(BOOL finished) {
        
    }];
}

@end
