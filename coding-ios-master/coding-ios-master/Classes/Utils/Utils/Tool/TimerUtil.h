//
//  TimerUtil.h
//  coding-ios-master
//
//  Created by MAC on 2018/5/15.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimerUtil : NSObject
SingleInterface(TimerUtil)

+ (instancetype)init;
// 设置数值
- (void)setNumber:(CGFloat)numer;
// 是否移动过快
- (BOOL)isMoveFast;

@end
