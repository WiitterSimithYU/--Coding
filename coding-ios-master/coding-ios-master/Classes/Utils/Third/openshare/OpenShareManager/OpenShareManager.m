//
//  OpenShareManager.m
//  ZhongLv
//
//  Created by MAC on 2018/5/11.
//  Copyright © 2018年 Zhonglv. All rights reserved.
//

#import "OpenShareManager.h"
#import "OpenShareHeader.h"

#pragma mark - 声明
@interface OpenShareManager ()

@property (nonatomic, copy  ) OpenShareSuccess success;
@property (nonatomic, copy  ) OpenShareError error;

@end

#pragma mark - 实现
@implementation OpenShareManager
SingleImplementation(OpenShareManager)


// 微信授权 - 第一步
- (void)wxAuth:(OpenShareSuccess)success error:(OpenShareError)error {
    // 回调
    _success = success;
    _error = error;
    // 授权
    __weak typeof(self) weak = self;
    [OpenShare WeixinAuth:@"snsapi_userinfo" Success:^(NSDictionary *message) {
        // 成功
        NSString *code = message[@"code"];
        [weak get_wxAccess_token:code];
    } Fail:^(NSDictionary *message, NSError *error) {
        // 失败
        if (_error) {
            _error();
        }
    }];
}
// 微信授权 - 第二步: 获取 access_token，openid，unionid
- (void)get_wxAccess_token:(NSString *)code {
    NSString *url = [NSString stringWithFormat:@"https://api.weixin.qq.com/sns/oauth2/access_token?appid=%@&secret=%@&code=%@&grant_type=authorization_code", kWXAppId, kWXAppSecreat, code];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *zoneUrl = [NSURL URLWithString:url];
        NSString *zoneStr = [NSString stringWithContentsOfURL:zoneUrl encoding:NSUTF8StringEncoding error:nil];
        NSData *data = [zoneStr dataUsingEncoding:NSUTF8StringEncoding];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (data) {
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                // 有数据
                if (dic && [dic allKeys].count != 0) {
                    [self get_wxUserInfo:dic];
                } else {
                    // 失败
                    if (_error) {
                        _error();
                    }
                }
            }
            // 没数据
            else {
                // 失败
                if (_error) {
                    _error();
                }
            }
        });
    });
}
// 微信授权 - 第三步: 获取个人信息
- (void)get_wxUserInfo:(NSDictionary *)data {
    NSString *access_token = data[@"access_token"];
    NSString *openid = data[@"openid"];
    NSString *url = [NSString stringWithFormat:@"https://api.weixin.qq.com/sns/userinfo?access_token=%@&openid=%@", access_token, openid];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *zoneUrl = [NSURL URLWithString:url];
        NSString *zoneStr = [NSString stringWithContentsOfURL:zoneUrl encoding:NSUTF8StringEncoding error:nil];
        NSData *data = [zoneStr dataUsingEncoding:NSUTF8StringEncoding];
        dispatch_async(dispatch_get_main_queue(), ^{
            // 有数据
            if (data) {
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                OpenShareInfoModel *model = [OpenShareInfoModel mj_objectWithKeyValues:dic];
                if (model && model.nickname && model.nickname.length != 0) {
                    if (_success) {
                        _success(model);
                    }
                }
                else {
                    // 失败
                    if (_error) {
                        _error();
                    }
                }
            }
            // 没数据
            else {
                // 失败
                if (_error) {
                    _error();
                }
            }
        });
    });
}


// QQ授权 - 第一步
- (void)qqAuth:(OpenShareSuccess)success error:(OpenShareError)error {
    // 回调
    _success = success;
    _error = error;
    // 授权
    __weak typeof(self) weak = self;
    [OpenShare QQAuth:@"get_user_info" Success:^(NSDictionary *message) {
        // 成功
        NSLog(@"qq回调=======%@",message);
        [weak get_qqUserInfo:message];
    } Fail:^(NSDictionary *message, NSError *error) {
        // 失败
        if (_error) {
            _error();
        }
    }];
    
}
// QQ授权 - 第二步: 用户信息
- (void)get_qqUserInfo:(NSDictionary *)code {
    NSString *access_token = code[@"access_token"];
    
    NSString *oauth_consumer_key = kQQAppId;
    NSString *openid = code[@"openid"];
    NSString *url = [NSString stringWithFormat:@"https://graph.qq.com/user/get_user_info?access_token=%@&oauth_consumer_key=%@&openid=%@&format=json", access_token, oauth_consumer_key, openid];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *zoneUrl = [NSURL URLWithString:url];
        NSString *zoneStr = [NSString stringWithContentsOfURL:zoneUrl encoding:NSUTF8StringEncoding error:nil];
        NSData *data = [zoneStr dataUsingEncoding:NSUTF8StringEncoding];
        dispatch_async(dispatch_get_main_queue(), ^{
            // 有数据
            if (data) {
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                // model转换
                OpenShareInfoModel *model = [[OpenShareInfoModel alloc] init];
                model.city = [dic objectForKey:@"city"];
                model.headimgurl = [dic objectForKey:@"figureurl_2"];
                model.sex = [[dic objectForKey:@"gender"] isEqualToString:@"男"] ? 1 : 0;
                model.nickname = [dic objectForKey:@"nickname"];
                model.province = [dic objectForKey:@"province"];
                model.openid = [code objectForKey:@"openid"];
                if (model.nickname && model.nickname.length != 0) {
                    if (_success) {
                        _success(model);
                    }
                }
                else {
                    if (_error) {
                        _error();
                    }
                }
            }
            // 没数据
            else {
                // 失败
                if (_error) {
                    _error();
                }
            }
        });
    });
}


// 微博授权 - 第一步
- (void)wbAuth:(OpenShareSuccess)success error:(OpenShareError)error {
    // 回调
    _success = success;
    _error = error;
    // 授权
    __weak typeof(self) weak = self;
    [OpenShare WeiboAuth:@"all" redirectURI:@"http://open.weibo.com/apps/402180334/info/advanced" Success:^(NSDictionary *message) {
        // 成功
        NSLog(@"123");
    } Fail:^(NSDictionary *message, NSError *error) {
        // 失败
        if (_error) {
            _error();
        }
    }];
}


@end

