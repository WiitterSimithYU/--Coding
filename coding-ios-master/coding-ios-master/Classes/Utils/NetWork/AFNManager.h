//
//  AFNManager.h
//  coding-ios-master
//
//  Created by MAC on 2018/4/21.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APPResult.h"

#pragma mark - typeof
typedef void(^ServiceCompleteBlock)(APPResult *result);
typedef void(^ProgressNetWorkBlock)(CGFloat currentProgress, CGFloat maxProgress, CGFloat percentage);

#pragma mark - 声明
@interface AFNManager : NSObject

+ (void)GET:(NSString *)url params:(NSDictionary *)params complete:(ServiceCompleteBlock)complete;
+ (void)GET:(NSString *)url params:(NSDictionary *)params progress:(ProgressNetWorkBlock)progress complete:(ServiceCompleteBlock)complete;

@end
