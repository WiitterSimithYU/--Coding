//
//  HomeHeader.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/7.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeHeader.h"
#import "DisplayLinkUtil.h"
#import "HomeDraw.h"
#import "HomeCircle.h"
#import "HomeHeaderSpeed.h"
#import "BaseView+HomeHeader.h"
#import "HomeControl.h"

#pragma mark - 声明
@interface HomeHeader()<HomeDrawDelegate, HomeHeaderSpeedDelegate, HomeHeaderSpeedDelegate>

@property (nonatomic, strong) HomeDraw *draw;
@property (nonatomic, strong) HomeCircle *circle;
/// 背景层
@property (nonatomic, strong) HomeHeaderBg *bg;
/// 音量
@property (nonatomic, strong) HomeHeaderSpeed *speed;
/// 控制
@property (nonatomic, strong) HomeControl *control;

@end

#pragma mark - 实现
@implementation HomeHeader

#pragma mark - 初始化
- (void)initUI {
    [self bg];
    [self draw];
    [self speed];
    [self control];
    [self circle];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setClipsToBounds:YES];
}
// 背景
- (HomeHeaderBg *)bg {
    if (!_bg) {
        _bg = [HomeHeaderBg loadCode:self.bounds];
        _bg.userInteractionEnabled = NO;
        [self addSubview:_bg];
    }
    return _bg;
}
// 绘图
- (HomeDraw *)draw {
    if (!_draw) {
        _draw = [HomeDraw loadCode:CGRectMake(0, 0, ScreenWidth, self.height)];
        _draw.delegate = self;
        [self addSubview:_draw];
    }
    return _draw;
}
// 圆圈
- (HomeCircle *)circle {
    if (!_circle) {
        _circle = [HomeCircle loadCode:CGRectMake(0, 0, ScreenWidth, self.height)];
        _circle.userInteractionEnabled = NO;
        [self addSubview:_circle];
    }
    return _circle;
}
// 音量
- (HomeHeaderSpeed *)speed {
    if (!_speed) {
        _speed = [HomeHeaderSpeed loadCode:CGRectMake(0, 0, ScreenWidth, 100)];
        _speed.delegate = self;
        _speed.centerY = self.centerY;
        _speed.top += [_speed createHeightWithWidth:HomeBgTriangleW + countcoordinatesX(50)];
//        _speed.top += [_speed createHeightWithWidth:HomeBgTriangleW];
        [self addSubview:_speed];
    }
    return _speed;
}
// 控制
- (HomeControl *)control {
    if (!_control) {
        _control = [HomeControl loadCode:CGRectMake(0, 0, ScreenWidth, self.height)];
        [_control setTop:_speed.top];
        [_control.back addTarget:self action:@selector(homeMusicClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_control];
    }
    return _control;
}

#pragma mark - 设置
// 设置背景颜色
- (void)setBgColor:(UIColor *)bgColor {
    _bgColor = bgColor;
    _bg.bgColor = bgColor;
}
// 设置高度
- (void)setHeight:(CGFloat)height {
    [super setHeight:height];
    [_bg setTop:height - ScreenWidth];
}
// 设置填充样式
- (void)setType:(HomeHeaderBgType)type {
    _type = type;
    _bg.type = type;
    if (_type == HomeHeaderBgTypeDefault) {
        [self.speed show:0];
        [self.control show:0];
    }
    else if (_type == HomeHeaderBgTypeSpeed) {
        [self.speed show:1];
        [self.control show:0];
    }
    else if (_type == HomeHeaderBgTypeControl) {
        [self.speed show:0];
        [self.control show:1];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _bgColor = [UIColor colorWithRed:random() % 255 / 255.f green:random() % 255 / 255.f blue:random() % 255 / 255.f alpha:1];
}

#pragma mark - 点击
/// 点击返回音量
- (void)homeMusicClick {
    if (self.delegate && [self.delegate respondsToSelector:@selector(homeHeader:didClickMusic:)]) {
        [self.delegate homeHeader:self didClickMusic:_control.back];
    }
}

#pragma mark - HomeHeaderSpeedDelegate
// 点击了关闭按钮
- (void)homeControl:(HomeHeaderSpeed *)view didTapClose:(UIButton *)close {
    if (self.delegate && [self.delegate respondsToSelector:@selector(homeHeader:didTapClose:)]) {
        [self.delegate homeHeader:self didTapClose:close];
    }
}

#pragma mark - HomeDrawDelegate
/// 点击了内三角形
- (void)homeDraw:(HomeDraw *)draw didClickInTriangle:(CAShapeLayer *)triangle {
    // 回调
    if (self.delegate && [self.delegate respondsToSelector:@selector(homeHeader:didClickInTriangle:)]) {
        [self.delegate homeHeader:self didClickInTriangle:triangle];
    }
    //
}
/// 点击了三个按钮
- (void)homeDraw:(HomeDraw *)draw didTapButton:(HomePushButton *)speed {
    if (self.delegate && [self.delegate respondsToSelector:@selector(homeHeader:didTapButton:)]) {
        [self.delegate homeHeader:self didTapButton:speed];
    }
}
/// 点击速率按钮
- (void)homeDraw:(HomeDraw *)draw didTapSpeed:(UIButton *)speed {
    if (self.delegate && [self.delegate respondsToSelector:@selector(homeHeader:didTapSpeed:)]) {
        [self.delegate homeHeader:self didTapSpeed:speed];
    }
}
/// 点击控制按钮
- (void)homeDraw:(HomeDraw *)draw didTapControl:(UIButton *)control {
    if (self.delegate && [self.delegate respondsToSelector:@selector(homeHeader:didTapControl:)]) {
        [self.delegate homeHeader:self didTapControl:control];
    }
}






@end

