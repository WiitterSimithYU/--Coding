//
//  BaseView+MMPulseView.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/10.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView+MMPulseView.h"

@implementation BaseView (MMPulseView)

- (MMPulseView *)createHalo:(CGFloat)minRadius maxRadius:(CGFloat)maxRadius frame:(CGRect)frame {
    MMPulseView *pulseView = [MMPulseView new];
    pulseView.frame = frame;
    pulseView.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    pulseView.colors = @[(__bridge id)[[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor, (__bridge id)[[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor];
    pulseView.startPoint = CGPointMake(0, 0.5);
    pulseView.endPoint = CGPointMake(1, 0.5);
    pulseView.minRadius = minRadius;
    pulseView.maxRadius = maxRadius;
    pulseView.duration = 5;
    pulseView.count = 1;
    pulseView.lineWidth = 2.0f;
    [pulseView startAnimation];
    [self addSubview:pulseView];
    return pulseView;
}

@end
