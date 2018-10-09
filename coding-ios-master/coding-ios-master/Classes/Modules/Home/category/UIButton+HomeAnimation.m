//
//  UIButton+HomeAnimation.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/9.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "UIButton+HomeAnimation.h"

@implementation UIButton (HomeAnimation)

- (void)addAnimationWithStyle:(HomePushButtonStyle)style
                    animation:(HomePushButtonAnimation)animation {
    [self addAnimationWithStyle:style animation:animation position:nil button:nil complete:nil];
}

- (void)addAnimationWithStyle:(HomePushButtonStyle)style
                    animation:(HomePushButtonAnimation)animation
                     position:(HomePushButtonTriangle)position {
    [self addAnimationWithStyle:style animation:animation position:position button:nil complete:nil];
}

- (void)addAnimationWithStyle:(HomePushButtonStyle)style
                    animation:(HomePushButtonAnimation)animation
                     position:(HomePushButtonTriangle)position
                       button:(HomePushBtn)button {
    [self addAnimationWithStyle:style animation:animation position:position button:button complete:nil];
}

- (void)addAnimationWithStyle:(HomePushButtonStyle)style
                    animation:(HomePushButtonAnimation)animation
                     position:(HomePushButtonTriangle)position
                       button:(HomePushBtn)button
                     complete:(HomeAnimationBlock)complete {
    [self addAnimationWithStyle:style animation:animation position:position button:button toValue:CGPointZero complete:complete];
}
- (void)addAnimationWithStyle:(HomePushButtonStyle)style
                    animation:(HomePushButtonAnimation)animation
                      toValue:(CGPoint)toValue {
    [self addAnimationWithStyle:style animation:animation position:HomePushButtonTriangleTop button:HomePushBtnOne toValue:toValue complete:nil];
}
- (void)addAnimationWithStyle:(HomePushButtonStyle)style
                    animation:(HomePushButtonAnimation)animation
                      toValue:(CGPoint)toValue
                     complete:(HomeAnimationBlock)complete {
    [self addAnimationWithStyle:style animation:animation position:HomePushButtonTriangleTop button:HomePushBtnOne toValue:toValue complete:complete];
}

- (void)addAnimationWithStyle:(HomePushButtonStyle)style
                    animation:(HomePushButtonAnimation)animation
                     position:(HomePushButtonTriangle)position
                       button:(HomePushBtn)button
                      toValue:(CGPoint)toValue
                     complete:(HomeAnimationBlock)complete {
    // 移动动画
    if (style == HomePushButtonStyleMove) {
        CGPoint point = CGPointZero;
        NSString *name = kCAMediaTimingFunctionEaseInEaseOut;
        NSTimeInterval dutation = 0;
        // 显示
        if (animation == HomePushButtonAnimationShow) {
            dutation = 0.3;
            // 顶部
            if (position == HomePushButtonTriangleTop) {
                if (button == HomePushBtnOne) {
                    point = CGPointMake(40, 40);
                }
                else if (button == HomePushBtnTwo) {
                    point = CGPointMake(-40, 40);
                }
                name = kCAMediaTimingFunctionEaseInEaseOut;
            }
            // 左边
            else if (position == HomePushButtonTriangleLeft) {
                if (button == HomePushBtnOne) {
                    point = CGPointMake(-20, -40);
                }
                else if (button == HomePushBtnTwo) {
                    point = CGPointMake(40, -20);
                }
                name = kCAMediaTimingFunctionEaseInEaseOut;
            }
            // 右边
            else if (position == HomePushButtonTriangleRight) {
                if (button == HomePushBtnOne) {
                    point = CGPointMake(-40, -20);
                }
                else if (button == HomePushBtnTwo) {
                    point = CGPointMake(20, -40);
                }
                name = kCAMediaTimingFunctionEaseInEaseOut;
            }
        }
        // 隐藏
        else if (animation == HomePushButtonAnimationHide) {
            dutation = 0.2;
            point = CGPointMake(0, 0);
            name = kCAMediaTimingFunctionEaseIn;
        }
        POPBasicAnimation *trans1A = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerTranslationXY];
        trans1A.toValue = [NSValue valueWithCGPoint:point];
        trans1A.duration = dutation;
        trans1A.timingFunction = [CAMediaTimingFunction functionWithName:name];
        if (complete) {
            trans1A.completionBlock = complete;
        }
        [self.layer pop_addAnimation:trans1A forKey:@"frame"];
    }
    // 透明度
    else if (style == HomePushButtonStyleAlpha) {
        NSNumber *fromValue = @(0);
        NSNumber *toValue = @(1);
        NSString *name = kCAMediaTimingFunctionEaseInEaseOut;
        NSTimeInterval dutation = 0;
        if (animation == HomePushButtonAnimationShow) {
            fromValue = @(0);
            toValue = @(1);
            dutation = 0.3;
            name = kCAMediaTimingFunctionEaseInEaseOut;
        }
        else if (animation == HomePushButtonAnimationHide) {
            fromValue = @(1);
            toValue = @(0);
            dutation = 0.2;
            name = kCAMediaTimingFunctionEaseIn;
        }
        POPBasicAnimation *alphaA = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
        alphaA.fromValue = fromValue;
        alphaA.toValue = toValue;
        alphaA.duration = dutation;
        alphaA.timingFunction = [CAMediaTimingFunction functionWithName:name];
        [self.layer pop_addAnimation:alphaA forKey:@"alpha"];
    }
    // 尺寸
    else if (style == HomePushButtonStyleScale) {
        // 显示
        if (animation == HomePushButtonAnimationShow) {
            POPBasicAnimation *scaleA = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
            scaleA.fromValue = [NSValue valueWithCGPoint:CGPointMake(0.1, 0.1)];
            scaleA.toValue = [NSValue valueWithCGPoint:CGPointMake(1.3, 1.3)];
            scaleA.duration = 0.3;
            scaleA.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            scaleA.completionBlock = ^(POPAnimation *anim, BOOL finished) {
                POPBasicAnimation *scaleA = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
                scaleA.toValue = [NSValue valueWithCGPoint:CGPointMake(0.9, 0.9)];
                scaleA.duration = 0.2;
                scaleA.beginTime = CACurrentMediaTime() + 0.05;
                scaleA.completionBlock = ^(POPAnimation *anim, BOOL finished) {
                    POPBasicAnimation *scaleA = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
                    scaleA.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
                    scaleA.duration = 0.2;
                    scaleA.completionBlock = ^(POPAnimation *anim, BOOL finished) {
                        
                    };
                    [self.layer pop_addAnimation:scaleA forKey:@"scaleXY"];
                };
                [self.layer pop_addAnimation:scaleA forKey:@"scaleXY"];
            };
            [self.layer pop_addAnimation:scaleA forKey:@"scaleXY"];
        }
        // 隐藏
        else if (animation == HomePushButtonAnimationHide) {
            POPBasicAnimation *scaleA = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
            scaleA.toValue = [NSValue valueWithCGPoint:toValue];
            scaleA.duration = 0.2;
            scaleA.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            if (complete) {
                scaleA.completionBlock = complete;
            }
            [self.layer pop_addAnimation:scaleA forKey:@"scaleXY"];
        }
    }
}

// 创建比例动画
- (void)createScale:(CGPoint)scale name:(NSString *)name duration:(NSTimeInterval)duration {
    [self createScale:scale name:name duration:duration complete:nil];
}
- (void)createScale:(CGPoint)scale name:(NSString *)name duration:(NSTimeInterval)duration complete:(HomeAnimationBlock)complete {
    POPBasicAnimation *scaleA = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleA.toValue = [NSValue valueWithCGPoint:scale];
    scaleA.duration = duration;
    scaleA.timingFunction = [CAMediaTimingFunction functionWithName:name];
    if (complete) {
        scaleA.completionBlock = complete;
    }
    [self.layer pop_addAnimation:scaleA forKey:@"scaleXY"];
}

@end
