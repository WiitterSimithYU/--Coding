//
//  HomeShapeView.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/7.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeShapeView.h"
#import "DisplayLinkUtil.h"

#pragma mark - 声明
@interface HomeShapeView()

@property (nonatomic, strong) CAShapeLayer *bgshape;
@property (nonatomic, strong) CAShapeLayer *shape;
@property (nonatomic, strong) DisplayLinkUtil *timer;

@end

#pragma mark - 实现
@implementation HomeShapeView

#pragma mark - 初始化
- (void)initUI {
    [self bgshape];
    [self shape];
}
- (CAShapeLayer *)bgshape {
    if (!_bgshape) {
        _bgshape = [CAShapeLayer layer];
        _bgshape.frame = [self bounds];
        _bgshape.path = ({
            CGFloat width = sqrt(pow(self.width / 2, 2) * 2);
            CGFloat height = width;
            CGFloat left = (self.width - width) / 2;
            CGFloat top = (self.height - height) / 2;
            CGPathRef path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(left, top, width, height) cornerRadius:width / 2].CGPath;
            path;
        });
        _bgshape.fillColor = [_shapeColor colorWithAlphaComponent:0.3].CGColor;
        [self.layer addSublayer:_bgshape];
    }
    return _bgshape;
}
- (CAShapeLayer *)shape {
    if (!_shape) {
        _shape = [CAShapeLayer layer];
        _shape.frame = [self bounds];
        _shape.fillColor = _shapeColor.CGColor;
        [self.layer addSublayer:_shape];
    }
    return _shape;
}

#pragma mark - 设置
// 设置状态
- (void)setStatus:(HomeShapeStatus)status {
    _status = status;
    if (status == HomeShapeStatusNotDownload) {
        [self.timer timerInvalidate];
        [self bgColorReset];
    }
    else if (status == HomeShapeStatusDownloading) {
        [self.timer timerInvalidate];
        [self bgColorReset];
    }
    else if (status == HomeShapeStatusDownloaded) {
        [self.timer timerInvalidate];
        _timer = [DisplayLinkUtil initWithBlock:^{
            _progress -= 0.05;
            _progress = _progress <= 0 ? 0 : _progress;
            // 小于0 结束定时器
            if (_progress <= 0) {
                [self.timer timerInvalidate];
                [self.shape setFillColor:[UIColor clearColor].CGColor];
                [self.bgshape setFillColor:[UIColor clearColor].CGColor];
            } else {
                [self.shape setFillColor:[_shapeColor colorWithAlphaComponent:_progress * 0.5].CGColor];
                [self.bgshape setFillColor:[_shapeColor colorWithAlphaComponent:_progress * 0.2].CGColor];
            }
            // 线条
            CGPathRef shapePath = [self rectWithProgress:sqrt(pow(self.width / 2 - countcoordinatesX(5), 2) * 2) * _progress];
            CGPathRef bgShapePath = [self rectWithProgress:sqrt(pow(self.width / 2, 2) * 2) * _progress];
            [self.shape setPath:shapePath];
            [self.bgshape setPath:bgShapePath];
        }];
    }
}
// 设置进度
- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    [self.timer timerInvalidate];
    // 线条
    CGFloat width = sqrt(pow(self.width / 2 - countcoordinatesX(5), 2) * 2) * progress;
    CGFloat height = width;
    CGFloat left = (self.width - width) / 2;
    CGFloat top = (self.height - height) / 2;
    CGPathRef path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(left, top, width, height) cornerRadius:width / 2].CGPath;
    [self.shape setPath:path];
    [self.shape setFillColor:[_shapeColor colorWithAlphaComponent:0.5].CGColor];
    [self.bgshape setFillColor:[_shapeColor colorWithAlphaComponent:0.2].CGColor];
}

#pragma mark - 操作
- (CGPathRef)rectWithProgress:(CGFloat)progress {
    progress = progress <= 0 ? 0 : progress;
    CGFloat width = progress;
    CGFloat height = width;
    CGFloat left = (self.width - width) / 2;
    CGFloat top = (self.height - height) / 2;
    CGPathRef path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(left, top, width, height) cornerRadius:width / 2].CGPath;
    return path;
}

#pragma mark - 操作
// 背景重置
- (void)bgColorReset {
    [self.bgshape setPath:[self rectWithProgress:sqrt(pow(self.width / 2, 2) * 2) * 1]];
}

@end
