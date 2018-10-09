//
//  OpenShareManager.h
//  ZhongLv
//
//  Created by MAC on 2018/5/11.
//  Copyright © 2018年 Zhonglv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OpenShareInfoModel.h"

// 授权成功
typedef void (^OpenShareSuccess)(OpenShareInfoModel *model);
// 失败
typedef void (^OpenShareError)();


#pragma mark - 声明
@interface OpenShareManager : NSObject
SingleInterface(OpenShareManager)

// 微信授权
- (void)wxAuth:(OpenShareSuccess)success error:(OpenShareError)error;
// QQ授权
- (void)qqAuth:(OpenShareSuccess)success error:(OpenShareError)error;
// 微博授权
- (void)wbAuth:(OpenShareSuccess)success error:(OpenShareError)error;


/*=============================================
 使用方式:
 [[OpenShareManager shareOpenShareManager] wbAuth:^(OpenShareInfoModel *model) {
 
 } error:^{
 
 }];
 
 =============================================*/

@end
