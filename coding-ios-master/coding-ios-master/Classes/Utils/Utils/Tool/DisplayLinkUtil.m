//
//  DisplayLinkUtil.m
//  coding-ios-master
//
//  Created by MAC on 2018/6/8.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "DisplayLinkUtil.h"

#pragma mark - 声明
@interface DisplayLinkUtil ()

@property (nonatomic, strong) CADisplayLink *timer;
@property (nonatomic, copy  ) DisplayLinkUtilBlock block;

@end

#pragma mark - 实现
@implementation DisplayLinkUtil

#pragma mark - 初始化
+ (instancetype)initWithBlock:(DisplayLinkUtilBlock)block {
    DisplayLinkUtil *view = [[DisplayLinkUtil alloc] init];
    [view timer];
    [view setBlock:block];
    return view;
}
- (CADisplayLink *)timer {
    if (!_timer) {
        _timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(callback)];
        [_timer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
    return _timer;
}
- (void)callback {
    if (_block) {
        _block();
    }
}

- (void)timerInvalidate {
    [_timer invalidate];
    _timer = nil;
}

@end
