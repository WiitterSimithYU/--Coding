//
//  DisplayLinkUtil.h
//  coding-ios-master
//
//  Created by MAC on 2018/6/8.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - type
typedef void (^DisplayLinkUtilBlock)(void);

#pragma mark - 声明
@interface DisplayLinkUtil : NSObject

+ (instancetype)initWithBlock:(DisplayLinkUtilBlock)block;
- (void)timerInvalidate;

@end
