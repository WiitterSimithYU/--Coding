//
//  HomeControl.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/10.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeControl.h"
#import "HomeCell.h"

#pragma mark - 声明
@interface HomeControl()

@property (nonatomic, strong) HomeCell *cell;
// return
@property (nonatomic, strong) UIButton *reset;
// 圆弧
@property (nonatomic, strong) CAShapeLayer *arc;
// 圆环
@property (nonatomic, strong) CAShapeLayer *ring;
// 大刻度
@property (nonatomic, strong) NSMutableArray<CAShapeLayer *> *scale_big;
// 小刻度
@property (nonatomic, strong) NSMutableArray<CAShapeLayer *> *scale_small;
// 刻度文本
@property (nonatomic, strong) NSMutableArray<UILabel *> *scale_label;

@end

#pragma mark - 实现
@implementation HomeControl

#pragma mark - 初始化
- (void)initUI {
    [self setUserInteractionEnabled:NO];
    [self cell];
    [self reset];
    [self scale_small];
    [self scale_big];
    [self arc];
    [self ring];
    [self scale_label];
    [self back];
}
- (HomeCell *)cell {
    if (!_cell) {
        _cell = [HomeCell loadCode:CGRectMake(0, self.height, ScreenWidth / 4, ScreenWidth / 4)];
        _cell.centerX = self.centerX;
        [self addSubview:_cell];
    }
    return _cell;
}
- (CAShapeLayer *)arc {
    if (!_arc) {
        _arc = [CAShapeLayer layer];
        _arc.strokeColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor;
        _arc.fillColor = [UIColor clearColor].CGColor;
        _arc.lineWidth = 2;
        _arc.path = ({
            UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.center radius:self.width / 4 - 17 startAngle:M_PI * 2 / 8 * 7 endAngle:M_PI * 2 / 8 * 5 clockwise:YES];
            path.CGPath;
        });
        _arc.strokeStart = 0.5;
        _arc.strokeEnd = 0.5;
        [self.layer addSublayer:_arc];
    }
    return _arc;
}
- (CAShapeLayer *)ring {
    if (!_ring) {
        _ring = [CAShapeLayer layer];
        _ring.strokeColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3].CGColor;
        _ring.fillColor = [UIColor clearColor].CGColor;
        _ring.lineWidth = 20;
        _ring.path = ({
            UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.center radius:self.width / 4 - 40 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
            path.CGPath;
        });
        _ring.opacity = 0;
        [self.layer addSublayer:_ring];
    }
    return _ring;
}
- (NSMutableArray<UILabel *> *)scale_label {
    if (!_scale_label) {
        _scale_label = [[NSMutableArray alloc] init];
        for (int i=0; i<7; i++) {
            UILabel *view = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 12)];
            CGPoint point = [self getPostionX:self.width / 2 withPostionY:self.height / 2 withRadius:self.width / 4 + 17 withCirAngle: 360 / 8.f * (i - 1)];
            view.centerX = point.x;
            view.centerY = point.y;
            view.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
            view.textColor = [UIColor whiteColor];
            view.textAlignment = NSTextAlignmentCenter;
            view.alpha = 0;
            view.text = [NSString stringWithFormat:@"%.1fx",1.3 - i * 0.1];
            [self addSubview:view];
            [_scale_label addObject:view];
        }
        CGPoint minPoint = [self getPostionX:self.width / 2 withPostionY:self.height / 2 withRadius:self.width / 4 + 17 withCirAngle: 360 / 8.f * 5];
        UILabel *min = [[UILabel alloc] initWithFrame:({
            CGRectMake((ScreenWidth - (self.width / 2 + 17)) / 2 - 40, minPoint.y, 35, 12);
        })];
        min.text = @"Min";
        min.textAlignment = NSTextAlignmentRight;
        min.textColor = [UIColor whiteColor];
        min.alpha = 0;
        min.font = [UIFont systemFontOfSize:14 weight:UIFontWeightMedium];
        min.centerY = minPoint.y;
        [self addSubview:min];
        [_scale_label addObject:min];
        
        UILabel *jian = [[UILabel alloc] initWithFrame:CGRectMake(min.left, min.top + min.height + countcoordinatesX(5), min.width, min.width)];
        jian.text = @"－";
        jian.textAlignment = NSTextAlignmentCenter;
        jian.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
        jian.textColor = [UIColor whiteColor];
        jian.alpha = 0;
        [self addSubview:jian];
        [_scale_label addObject:jian];
        
        
        CGPoint maxPoint = [self getPostionX:self.width / 2 withPostionY:self.height / 2 withRadius:self.width / 4 + 17 withCirAngle: 360 / 8.f * -1];
        UILabel *max = [[UILabel alloc] initWithFrame:({
            CGRectMake(ScreenWidth - (ScreenWidth - (self.width / 2 + 17)) / 2, maxPoint.y, 35, 12);
        })];
        max.text = @"Max";
        max.textColor = [UIColor whiteColor];
        max.font = [UIFont systemFontOfSize:14 weight:UIFontWeightMedium];
        max.centerY = maxPoint.y;
        max.alpha = 0;
        [self addSubview:max];
        [_scale_label addObject:max];
        
        UILabel *jia = [[UILabel alloc] initWithFrame:CGRectMake(max.left, max.top + max.height + countcoordinatesX(5), max.width, max.width)];
        jia.text = @"＋";
        jia.textAlignment = NSTextAlignmentCenter;
        jia.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
        jia.textColor = [UIColor whiteColor];
        jia.alpha = 0;
        [self addSubview:jia];
        [_scale_label addObject:jia];
        
        
        UILabel *speed = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
        speed.centerX = self.width / 2;
        speed.centerY = self.height / 2;
        speed.text = @"1.00x";
        speed.textAlignment = NSTextAlignmentCenter;
        speed.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        speed.textColor = [UIColor whiteColor];
        speed.alpha = 0;
        [self addSubview:speed];
        [_scale_label addObject:speed];
        
        UILabel *speedlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
        speedlabel.centerX = self.width / 2;
        speedlabel.top = CGRectGetMaxY(speed.frame);
        speedlabel.text = @"倍速";
        speedlabel.textAlignment = NSTextAlignmentCenter;
        speedlabel.font = [UIFont systemFontOfSize:10 weight:UIFontWeightBold];
        speedlabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
        speedlabel.alpha = 0;
        [self addSubview:speedlabel];
        [_scale_label addObject:speedlabel];
        
    }
    return _scale_label;
}
- (NSMutableArray<CAShapeLayer *> *)scale_big {
    if (!_scale_big) {
        _scale_big = [[NSMutableArray alloc] init];
        for (int i=-2; i<11; i++) {
            CAShapeLayer *layer = [CAShapeLayer layer];
            layer.frame = self.bounds;
            layer.path = ({
                UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.width / 2, self.height / 2) radius:self.width / 4 startAngle:M_PI / 8.f * i endAngle:M_PI / 8.f * i clockwise:YES];
                [path addLineToPoint:CGPointMake(self.width / 2, self.height / 2)];
                path.CGPath;
            });
            layer.strokeStart = 0.1;
            layer.strokeEnd = 0.1;
            layer.lineWidth = 1.0f;
            layer.masksToBounds = YES;
            layer.fillColor = [UIColor clearColor].CGColor;
            layer.strokeColor = [UIColor whiteColor].CGColor;
            [self.layer addSublayer:layer];
            [_scale_big addObject:layer];
        }
    }
    return _scale_big;
}
- (NSMutableArray<CAShapeLayer *> *)scale_small {
    if (!_scale_small) {
        _scale_small = [[NSMutableArray alloc] init];
        for (int i=-10; i<50; i++) {
            CAShapeLayer *layer = [CAShapeLayer layer];
            layer.frame = self.bounds;
            layer.path = ({
                UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.width / 2, self.height / 2) radius:self.width / 4 startAngle:M_PI * 2 / 80.f * i endAngle:M_PI * 2 / 80.f * i clockwise:YES];
                [path addLineToPoint:CGPointMake(self.width / 2, self.height / 2)];
                path.CGPath;
            });
            layer.strokeStart = 0.05;
            layer.strokeEnd = 0.05;
            layer.lineWidth = 1.0f;
            layer.masksToBounds = YES;
            layer.fillColor = [UIColor clearColor].CGColor;
            layer.strokeColor = [UIColor whiteColor].CGColor;
            [self.layer addSublayer:layer];
            [_scale_small addObject:layer];
        }
    }
    return _scale_small;
}
- (UIButton *)back {
    if (!_back) {
        _back = [UIButton buttonWithType:UIButtonTypeCustom];
        [_back setTitle:@"返回音量调节" forState:UIControlStateNormal];
        [_back.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [_back setFrame:CGRectMake(0, self.height, 100, 25)];
        [_back.layer setCornerRadius:_back.height / 2];
        [_back.layer setMasksToBounds:YES];
        [_back.layer setBorderWidth:1];
        [_back.layer setBorderColor:[UIColor whiteColor].CGColor];
        [_back setCenterX:self.width / 2];
        [self addSubview:_back];
    }
    return _back;
}
- (UIButton *)reset {
    if (!_reset) {
        CGPoint point = [self getPostionX:self.width / 2 withPostionY:self.height / 2 withRadius:self.width / 4 + 17 withCirAngle: 360 / 8.f * 5];
        
        _reset = [UIButton buttonWithType:UIButtonTypeCustom];
        [_reset setFrame:CGRectMake(0, 0, 20, 20)];
        [_reset setBackgroundColor:[UIColor whiteColor]];
        [_reset setCenterX:self.width / 2];
        [_reset setCenterY:point.y];
        [_reset setAlpha:0];
        [self addSubview:_reset];
    }
    return _reset;
}

#pragma mark - 设置
- (void)show:(CGFloat)alpha {
    // 显示
    if (alpha == 1) {
        [self setUserInteractionEnabled:YES];
        [UIView animateWithDuration:.5f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            _cell.top = 0;
            _back.top = [self getPostionX:self.width / 2 withPostionY:self.height / 2 withRadius:self.width / 4 + 17 withCirAngle: 360 / 8.f * 2].y + 20;
        } completion:^(BOOL finished) {
            
        }];
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
        animation.duration = 2.f;   // 持续时间
        animation.beginTime = CACurrentMediaTime() + 0.15;
        animation.toValue = @(0);   // 到 1 结束
        animation.removedOnCompletion = NO;//动画对象不要移除
        animation.fillMode = kCAFillModeForwards;//保存当前的状态
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [_arc addAnimation:animation forKey:@""];
        
        
        CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation2.duration = 2.f;   // 持续时间
        animation2.beginTime = CACurrentMediaTime() + 0.15;
        animation2.toValue = @(1);   // 到 1 结束
        animation2.removedOnCompletion = NO;//动画对象不要移除
        animation2.fillMode = kCAFillModeForwards;//保存当前的状态
        animation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [_arc addAnimation:animation2 forKey:@""];
        
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            for (int i=0; i<13; i++) {
                CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
                animation.duration = 1.f;   // 持续时间
                animation.toValue = @(0.01);   // 到 1 结束
                animation.removedOnCompletion = NO;//动画对象不要移除
                animation.fillMode = kCAFillModeForwards;//保存当前的状态
                animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                [self.scale_big[i] addAnimation:animation forKey:@""];
            }
            for (int i=0; i<60; i++) {
                CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
                animation.duration = 1.f;   // 持续时间
                animation.toValue = @(0.1);   // 到 1 结束
                animation.removedOnCompletion = NO;//动画对象不要移除
                animation.fillMode = kCAFillModeForwards;//保存当前的状态
                animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                [self.scale_small[i] addAnimation:animation forKey:@""];
            }
            
            
            CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"opacity"];
            animation2.duration = 2.f;   // 持续时间
            animation2.beginTime = CACurrentMediaTime() + 0.15;
            animation2.toValue = @(1);   // 到 1 结束
            animation2.removedOnCompletion = NO;//动画对象不要移除
            animation2.fillMode = kCAFillModeForwards;//保存当前的状态
            animation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            [_ring addAnimation:animation2 forKey:@""];
            
            [UIView animateWithDuration:1.f delay:.3f options:UIViewAnimationOptionCurveEaseInOut animations:^{
                for (int i=0; i<_scale_label.count; i++) {
                    _scale_label[i].alpha = 1;
                }
                _reset.alpha = 1;
            } completion:^(BOOL finished) {
                
            }];
        });
    }
    // 隐藏
    else {
        [self setUserInteractionEnabled:NO];
        __weak typeof(self) weak = self;
        [UIView animateWithDuration:.5f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            weak.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, weak.height);
        } completion:^(BOOL finished) {
            _reset.alpha = 0;
            for (int i=0; i<60; i++) {
                [weak.scale_small[i] removeAllAnimations];
            }
            for (int i=0; i<13; i++) {
                [weak.scale_big[i] removeAllAnimations];
            }
            for (int i=0; i<_scale_label.count; i++) {
                _scale_label[i].alpha = 0;
            }
            [_arc removeAllAnimations];
            [_ring removeAllAnimations];
            _cell.top = weak.height;
            _back.top = self.height;
            weak.transform = CGAffineTransformIdentity;
        }];
    }
}

- (CGPoint)getPostionX:(CGFloat)cirX withPostionY:(CGFloat)cirY withRadius:(CGFloat)radiu withCirAngle:(CGFloat)cirAngle
{
    CGPoint point;
    CGFloat posX = 0.0;
    CGFloat posY = 0.0;
    CGFloat arcAngle = M_PI * cirAngle / 180.0;
    if (cirAngle < 90) {
        posX = cirX + cos(arcAngle) * radiu;
        posY = cirY + sin(arcAngle) * radiu;
    } else if (cirAngle == 90) {
        posX = cirX;
        posY = cirY + radiu;
    } else if (cirAngle > 90 && cirAngle < 180) {
        arcAngle = M_PI * (180 - cirAngle) / 180.0;
        posX = cirX - cos(arcAngle) * radiu;
        posY = cirY + sin(arcAngle) * radiu;
    } else if (cirAngle == 180) {
        posX = cirX - radiu;
        posY = cirY;
    } else if (cirAngle > 180 && cirAngle < 270) {
        arcAngle = M_PI * (cirAngle - 180) / 180.0;
        posX = cirX - cos(arcAngle) * radiu;
        posY = cirY - sin(arcAngle) * radiu;
    } else if (cirAngle == 270) {
        posX = cirX;
        posY = cirY - radiu;
    } else {
        arcAngle = M_PI * (360 - cirAngle) / 180.0;
        posX = cirX + cos(arcAngle) * radiu;
        posY = cirY - sin(arcAngle) * radiu;
    }
    point.x = posX;
    point.y = posY;
    return point;
}

@end
