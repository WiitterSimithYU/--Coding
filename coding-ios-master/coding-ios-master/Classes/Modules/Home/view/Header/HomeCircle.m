//
//  HomeCircle.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/8.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeCircle.h"
#import "BaseView+HomeHeader.h"

#pragma mark - NS_ENUM
typedef NS_ENUM(NSInteger, HomeCircleAnimation) {
    HomeCircleAnimationShow,   // 显示
    HomeCircleAnimationHide,   // 隐藏
};

#pragma mark - 声明
@interface HomeCircle()

@property (nonatomic, strong) CAShapeLayer *bgCircle;
@property (nonatomic, strong) CAShapeLayer *circle;
@property (nonatomic, strong) UILabel *time;

@end

#pragma mark - 实现
@implementation HomeCircle

- (void)initUI {
    [self time];
    [self bgCircle];
//    [self circle];
}
- (CAShapeLayer *)bgCircle {
    if (!_bgCircle) {
        // 三角边
        CGFloat circleW = self.width / 5 * 2;
        // 高度
        CGFloat circleH = sqrt(pow(circleW, 2) - pow(circleW / 2, 2));
        // 顶部
        CGFloat top = (self.height - circleH) / 2;
        CGFloat left = (self.width - circleH) / 2;
        
        _bgCircle = [CAShapeLayer layer];
        _bgCircle.frame = [self bounds];
        _bgCircle.strokeColor = [UIColor whiteColor].CGColor;
        _bgCircle.fillColor = [UIColor clearColor].CGColor;
        _bgCircle.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(left, top, circleH, circleH) cornerRadius:50].CGPath;
        [self.layer addSublayer:_bgCircle];
    }
    return _bgCircle;
}
- (CAShapeLayer *)circle {
    if (!_circle) {
        _circle = [CAShapeLayer layer];
        _circle.frame = [self bounds];
        _circle.fillColor = [UIColor blueColor].CGColor;
        [self.layer addSublayer:_circle];
    }
    return _circle;
}
- (UILabel *)time {
    if (!_time) {
        _time = [[UILabel alloc] initWithFrame:({
            CGFloat width = [self createWidthWithWidth:self.width / 5 * 2];
            CGFloat height = 20;
            CGFloat top = [self createTopWithWidth:self.width / 5 * 2] + [self createHeightWithWidth:self.width / 5 * 2] - height / 2;
            CGRectMake(0, top, width, height);
        })];
        _time.centerX = self.centerX;
        _time.text = @"01:24:00";
        _time.textAlignment = NSTextAlignmentCenter;
        _time.font = [UIFont systemFontOfSize:adjustFont(14)];
        _time.textColor = [UIColor whiteColor];
        [self addSubview:_time];
    }
    return _time;
}

@end
