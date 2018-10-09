//
//  NSString+API.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/21.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "NSString+API.h"

#define KHost @"http://127.0.0.1:3000"

@implementation NSString (API)

/// Store列表
+ (NSString *)getStoreList {
    return [NSString stringWithFormat:@"%@/songlist",KHost];
}


@end
