//
//  SaveUtils.m
//  KKTest
//
//  Created by RY on 17/6/12.
//  Copyright © 2017年 OuDa. All rights reserved.
//

#import "SaveUtils.h"

@implementation SaveUtils

/// 存值
+ (void)saveString:(NSString *)str forKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/// 取值
+ (NSString *)getStringForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] valueForKey:key];
}

/// 取值
+ (NSString *)getStringForKey:(NSString *)key default:(NSString *)defStr {
    NSString *str = [[NSUserDefaults standardUserDefaults] valueForKey:key];
    str = (!str || str.length == 0) ? defStr : str;
    return str;
}

/// 删除用户偏好设置
+ (void)removeUserDataForkey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:key];
}

@end
