//
//  AFNManager.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/21.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "AFNManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation AFNManager

static AFHTTPSessionManager *_manager;

+ (AFHTTPSessionManager *)manager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [AFHTTPSessionManager manager];
    });
    return _manager;
}
+ (void)GET:(NSString *)url params:(NSDictionary *)params complete:(ServiceCompleteBlock)complete {
    [self GET:url params:params progress:nil complete:complete];
}
+ (void)GET:(NSString *)url params:(NSDictionary *)params progress:(ProgressNetWorkBlock)progress complete:(ServiceCompleteBlock)complete {
    // NSLog(@"当前请求: %@", url);
    AFHTTPSessionManager *manager = [self manager];
    [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        // NSLog(@"请求中: %@", url);
        if (progress) {
            progress(downloadProgress.completedUnitCount, downloadProgress.totalUnitCount, downloadProgress.fractionCompleted);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // NSLog(@"请求成功: %@", url);
        if (complete) {
            APPResult *result = [[APPResult alloc] init];
            result.data = responseObject;
            result.result = ServiceTypeSuccess;
            complete(result);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull err) {
        // NSLog(@"请求失败: %@", url);
        if (complete) {
            APPResult *result = [[APPResult alloc] init];
            result.data = nil;
            result.result = ServiceTypeFail;
            complete(result);
        }
    }];
}

@end
