//
//  HomeHeaderBg.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/10.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeHeaderBg.h"
#import "DisplayLinkUtil.h"

#pragma mark - 声明
@interface HomeHeaderBg()

@property (nonatomic, strong) UIView *back;
@property (nonatomic, strong) NSMutableArray<CAShapeLayer *> *shape;
@property (nonatomic, strong) NSMutableArray<CAShapeLayer *> *shape2;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<NSNumber *> *> *controls;
@property (nonatomic, strong) DisplayLinkUtil *link;

@end

#pragma mark - 实现
@implementation HomeHeaderBg

- (void)initUI {
    [self back];
    [self shape];
    [self shape2];
    [self setClipsToBounds:NO];
    [self setUserInteractionEnabled:NO];
}
// 顶部背景色
- (UIView *)back {
    if (!_back) {
        _back = [[UIView alloc] initWithFrame:CGRectMake(0, -ScreenHeight, ScreenWidth, ScreenHeight)];
        [self addSubview:_back];
    }
    return _back;
}
// 背景层
- (NSMutableArray<CAShapeLayer *> *)shape {
    if (!_shape) {
        _shape = [[NSMutableArray alloc] init];
        for (int i=0; i<10; i++) {
            CAShapeLayer *shape = [CAShapeLayer layer];
            shape.frame = [self bounds];
            shape.fillColor = [ColorTextMedium colorWithAlphaComponent:0.1].CGColor;
            [self.layer addSublayer:shape];
            [_shape addObject:shape];
        }
    }
    return _shape;
}
// 背景层
- (NSMutableArray<CAShapeLayer *> *)shape2 {
    if (!_shape2) {
        _shape2 = [[NSMutableArray alloc] init];
        for (int i=0; i<10; i++) {
            CAShapeLayer *shape = [CAShapeLayer layer];
            shape.frame = [self.back bounds];
            shape.fillColor = [[UIColor grayColor] colorWithAlphaComponent:0.1].CGColor;
            [self.back.layer addSublayer:shape];
            [_shape2 addObject:shape];
        }
    }
    return _shape2;
}
// 绘制点
- (NSMutableArray<NSMutableArray<NSNumber *> *> *)controls {
    if (!_controls) {
        _controls = [self createControls];
    }
    return _controls;
}
//// 背景轨迹
//- (NSMutableArray<NSMutableArray<NSNumber *> *> *)controls {
//    if (!_controls) {
//        _controls = [[NSMutableArray alloc] init];
//        for (int i=0; i<self.shape.count; i++) {
//            if (i == 0) {
//                [_controls addObject:[NSMutableArray arrayWithArray:@[@(self.height - 20),@(ScreenWidth / 2),@(self.height),@(self.height - 20)]]];
//            }
//            else if (i == 1) {
//                [_controls addObject:[NSMutableArray arrayWithArray:@[@(self.height - 20),@(ScreenWidth / 2),@(self.height - 10),@(self.height - 30)]]];
//            }
//            else if (i == 2) {
//                [_controls addObject:[NSMutableArray arrayWithArray:@[@(self.height - 30),@(ScreenWidth / 2),@(self.height - 20),@(self.height - 20)]]];
//            }
//            else if (i == 3) {
//                [_controls addObject:[NSMutableArray arrayWithArray:@[@(self.height - 30),@(ScreenWidth / 2),@(self.height - 30),@(self.height - 35)]]];
//            }
//            else if (i == 4) {
//                [_controls addObject:[NSMutableArray arrayWithArray:@[@(self.height - 50),@(ScreenWidth / 2),@(self.height - 35),@(self.height - 40)]]];
//            }
//            else if (i == 5) {
//                [_controls addObject:[NSMutableArray arrayWithArray:@[@(self.height - 50),@(ScreenWidth / 2),@(self.height - 35),@(self.height - 50)]]];
//            }
//            else if (i == 6) {
//                [_controls addObject:[NSMutableArray arrayWithArray:@[@(self.height - 55),@(ScreenWidth / 2),@(self.height - 45),@(self.height - 65)]]];
//            }
//            else if (i == 7) {
//                [_controls addObject:[NSMutableArray arrayWithArray:@[@(self.height - 65),@(ScreenWidth / 2),@(self.height - 45),@(self.height - 55)]]];
//            }
//            else if (i == 8) {
//                [_controls addObject:[NSMutableArray arrayWithArray:@[@(self.height - 85),@(ScreenWidth / 2 + 20),@(self.height - 55),@(self.height - 75)]]];
//            }
//            else if (i == 9) {
//                [_controls addObject:[NSMutableArray arrayWithArray:@[@(self.height - 75),@(ScreenWidth / 2 + 20),@(self.height - 55),@(self.height - 85)]]];
//            }
//        }
//    }
//    return _controls;
//}
// 创建点
- (NSMutableArray *)createControls {
    NSMutableArray *controls = [[NSMutableArray alloc] init];
    for (int i=0; i<self.shape.count; i++) {
        if (i == 0) {
            [controls addObject:[NSMutableArray arrayWithArray:@[@(ScreenWidth - 20),@(ScreenWidth / 2),@(ScreenWidth),@(ScreenWidth - 20)]]];
        }
        else if (i == 1) {
            [controls addObject:[NSMutableArray arrayWithArray:@[@(ScreenWidth - 20),@(ScreenWidth / 2),@(ScreenWidth - 10),@(ScreenWidth - 30)]]];
        }
        else if (i == 2) {
            [controls addObject:[NSMutableArray arrayWithArray:@[@(ScreenWidth - 30),@(ScreenWidth / 2),@(ScreenWidth - 20),@(ScreenWidth - 20)]]];
        }
        else if (i == 3) {
            [controls addObject:[NSMutableArray arrayWithArray:@[@(ScreenWidth - 30),@(ScreenWidth / 2),@(ScreenWidth - 30),@(ScreenWidth - 35)]]];
        }
        else if (i == 4) {
            [controls addObject:[NSMutableArray arrayWithArray:@[@(ScreenWidth - 50),@(ScreenWidth / 2),@(ScreenWidth - 35),@(ScreenWidth - 40)]]];
        }
        else if (i == 5) {
            [controls addObject:[NSMutableArray arrayWithArray:@[@(ScreenWidth - 50),@(ScreenWidth / 2),@(ScreenWidth - 35),@(ScreenWidth - 50)]]];
        }
        else if (i == 6) {
            [controls addObject:[NSMutableArray arrayWithArray:@[@(ScreenWidth - 55),@(ScreenWidth / 2),@(ScreenWidth - 45),@(ScreenWidth - 65)]]];
        }
        else if (i == 7) {
            [controls addObject:[NSMutableArray arrayWithArray:@[@(ScreenWidth - 65),@(ScreenWidth / 2),@(ScreenWidth - 45),@(ScreenWidth - 55)]]];
        }
        else if (i == 8) {
            [controls addObject:[NSMutableArray arrayWithArray:@[@(ScreenWidth - 85),@(ScreenWidth / 2 + 20),@(ScreenWidth - 55),@(ScreenWidth - 75)]]];
        }
        else if (i == 9) {
            [controls addObject:[NSMutableArray arrayWithArray:@[@(ScreenWidth - 75),@(ScreenWidth / 2 + 20),@(ScreenWidth - 55),@(ScreenWidth - 85)]]];
        }
    }
    return controls;
}

#pragma mark - 设置
// 背景色
- (void)setBgColor:(UIColor *)bgColor {
    _bgColor = bgColor;
    [self drawBgPath:[self createControls]];
}
// 填充样式
- (DisplayLinkUtil *)link {
    if (_link) {
        [_link timerInvalidate];
        _link = nil;
    }
    if (!_link) {
        _link = [DisplayLinkUtil initWithBlock:^{
            // 填充
            if (_type == HomeHeaderBgTypeControl) {
                for (int i=0; i<self.controls.count; i++) {
                    NSMutableArray *arrm = self.controls[i];
                    CGFloat left = [arrm[0] floatValue];
                    CGFloat center = [arrm[2] floatValue];
                    CGFloat right = [arrm[3] floatValue];
                    if (center < ScreenHeight) {
                        center += 7;
                    }
                    if (left < center) {
                        left += 7;
                    }
                    if (right < center) {
                        right += 7;
                    }
                    [arrm replaceObjectAtIndex:0 withObject:@(left)];
                    [arrm replaceObjectAtIndex:2 withObject:@(center)];
                    [arrm replaceObjectAtIndex:3 withObject:@(right)];
                    [self.controls replaceObjectAtIndex:i withObject:arrm];
                }
                [self drawBgPath:self.controls];
            }
            // 还原
            else if (_type == HomeHeaderBgTypeDefault || _type == HomeHeaderBgTypeSpeed) {
                NSMutableArray *controls = [self createControls];
                for (int i=0; i<controls.count; i++) {
                    NSMutableArray *original = controls[i];
                    NSMutableArray *now = self.controls[i];
                    if ([now[0] floatValue] > [original[0] floatValue]) {
                        now[0] = @([now[0] floatValue] - 20);
                    }
                    else {
                        now[0] = original[0];
                    }
                    if ([now[2] floatValue] > [original[2] floatValue]) {
                        now[2] = @([now[2] floatValue] - 20);
                    }
                    else {
                        now[2] = original[2];
                    }
                    if ([now[3] floatValue] > [original[3] floatValue]) {
                        now[3] = @([now[3] floatValue] - 20);
                    }
                    else {
                        now[3] = original[3];
                    }
                    [_controls replaceObjectAtIndex:i withObject:now];
                }
                [self drawBgPath:_controls];
            }
        }];
    }
    return _link;
}
// 设置填充样式
- (void)setType:(HomeHeaderBgType)type {
    _type = type;
    [self link];
}
// 绘制背景层
- (void)drawBgPath:(NSArray *)controls {
    for (int i=0; i<_shape.count; i++) {
        CAShapeLayer *layer = _shape[i];
        layer.fillColor = [_bgColor colorWithAlphaComponent:0.1].CGColor;
        NSArray *numbers = controls[i];
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, 0, 0);
        CGPathAddLineToPoint(path, NULL, ScreenWidth, 0);
        CGPathAddLineToPoint(path, NULL, ScreenWidth, [numbers[3] floatValue]);
        CGPathAddQuadCurveToPoint(path, nil, [numbers[1] floatValue], [numbers[2] floatValue], 0, [numbers[0] floatValue]);
        layer.path = path;
    }
    for (int i=0; i<_shape2.count; i++) {
        CAShapeLayer *layer = _shape2[i];
        layer.fillColor = [_bgColor colorWithAlphaComponent:0.1].CGColor;
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, 0, 0);
        CGPathAddLineToPoint(path, NULL, ScreenWidth, 0);
        CGPathAddLineToPoint(path, NULL, ScreenWidth, _back.height);
        CGPathAddLineToPoint(path, NULL, 0, _back.height);
        layer.path = path;
    }
}



@end
