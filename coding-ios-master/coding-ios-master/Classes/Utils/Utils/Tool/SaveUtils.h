//
//  SaveUtils.h
//  KKTest
//
//  Created by RY on 17/6/12.
//  Copyright © 2017年 OuDa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SaveUtils : NSObject

/// 存值
+ (void)saveString:(NSString *)str forKey:(NSString *)key;

/// 取值
+ (NSString *)getStringForKey:(NSString *)key;

/// 取值
+ (NSString *)getStringForKey:(NSString *)key default:(NSString *)defStr;

/// 删除用户偏好设置
+ (void)removeUserDataForkey:(NSString*)key;

@end
