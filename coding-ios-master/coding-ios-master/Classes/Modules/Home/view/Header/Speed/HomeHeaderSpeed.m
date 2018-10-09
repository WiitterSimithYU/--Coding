//
//  HomeHeaderSpeed.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/10.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeHeaderSpeed.h"
#import "HomeHeaderSlider.h"

#pragma mark - 声明
@interface HomeHeaderSpeed()<HomeHeaderSliderDelegate>

@property (nonatomic, strong) NSMutableArray<HomeHeaderSlider *> *sliders;
@property (nonatomic, strong) UIButton *close;

@end

#pragma mark - 实现
@implementation HomeHeaderSpeed

#pragma mark - 初始化
- (void)initUI {
    [self setAlpha:0];
    [self setUserInteractionEnabled:NO];
    [self close];
    [self setHeight:CGRectGetMaxY(_close.frame)];
}
- (NSMutableArray<HomeHeaderSlider *> *)sliders {
    if (!_sliders) {
        _sliders = [[NSMutableArray alloc] init];
        for (int i=0; i<3; i++) {
            HomeHeaderSlider *slider = [HomeHeaderSlider loadCode:CGRectMake(0, 25 * i, ScreenWidth, 25)];
            [slider setTag:i];
            [slider setDelegate:self];
            [self addSubview:slider];
            [_sliders addObject:slider];
        }
    }
    return _sliders;
}
- (UIButton *)close {
    if (!_close) {
        __weak typeof(self) weak = self;
        _close = [UIButton buttonWithType:UIButtonTypeCustom];
        [_close setFrame:CGRectMake(0, CGRectGetMaxY([self.sliders lastObject].frame) +countcoordinatesX(20), 25, 25)];
        [_close setCenterX:self.centerX];
        [_close setAlpha:0.7];
        [_close setImage:[UIImage imageNamed:@"cha_message"] forState:UIControlStateNormal];
        [_close setImage:[UIImage imageNamed:@"cha_message"] forState:UIControlStateHighlighted];
        [_close addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            if (weak.delegate && [weak.delegate respondsToSelector:@selector(homeControl:didTapClose:)]) {
                [weak.delegate homeControl:weak didTapClose:weak.close];
            }
        }];
        [self addSubview:_close];
    }
    return _close;
}

#pragma mark - 设置
- (void)show:(CGFloat)alpha {
    [UIView animateWithDuration:.3f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self setAlpha:alpha];
    } completion:^(BOOL finished) {
        [self setUserInteractionEnabled:YES];
    }];
}

#pragma mark - HomeHeaderSliderDelegate
- (void)headerSlider:(HomeHeaderSlider *)slider valueDidChange:(CGFloat)percentage {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HomeDrawNSNotification" object:slider];
}

@end
