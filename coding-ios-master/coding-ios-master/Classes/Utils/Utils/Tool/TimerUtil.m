//
//  TimerUtil.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/15.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "TimerUtil.h"

#pragma mark - 声明
@interface TimerUtil()

@property (nonatomic, strong) NSTimer *timer;   // 定时器
@property (nonatomic, assign, getter=isMoveFast) BOOL moveFast;    // 移动是否过快
@property (nonatomic, assign, getter=isSetValue) BOOL setValue;    // 允许设值
@property (nonatomic, assign) NSNumber *oneNumber;
@property (nonatomic, assign) NSNumber *twoNumber;

@end

#pragma mark - 实现
@implementation TimerUtil
SingleImplementation(TimerUtil)

+ (instancetype)init {
    TimerUtil *util = [TimerUtil shareTimerUtil];
    util.moveFast = NO;
    util.setValue = YES;
    return util;
}

// 设置数值
- (void)setNumber:(CGFloat)numer {
    if (_setValue == NO) {
        return;
    }
    
    if (_oneNumber == nil) {
        _oneNumber = @(numer);
    }
    if (_twoNumber == nil) {
        _oneNumber = @(numer);
    }
}
// 是否移动过快
- (BOOL)isMoveFast {
    return _moveFast;
}


@end
