//
//  APPResult.h
//  coding-ios-master
//
//  Created by MAC on 2018/5/24.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - typeof
typedef NS_ENUM(NSInteger, ServiceType) {
    ServiceTypeSuccess = 0,     // 成功
    ServiceTypeFail = 1,        // 失败
};

@interface APPResult : NSObject

@property (nonatomic, assign) ServiceType result;
@property (nonatomic, strong) id data;

@end
