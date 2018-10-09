//
//  OpenShareInfoModel.h
//  ZhongLv
//
//  Created by MAC on 2018/5/11.
//  Copyright © 2018年 Zhonglv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OpenShareInfoModel : NSObject

@property (nonatomic, copy  ) NSString *city;       // 城市
@property (nonatomic, copy  ) NSString *province;   // 省
@property (nonatomic, assign) NSInteger sex;        // 性别
@property (nonatomic, copy  ) NSString *country;    // 国家
@property (nonatomic, copy  ) NSString *headimgurl; // 头像
@property (nonatomic, copy  ) NSString *language;   // 语言
@property (nonatomic, copy  ) NSString *nickname;   // 昵称
@property (nonatomic, copy  ) NSString *openid;     // openid
@property (nonatomic, copy  ) NSString *unionid;    // unionid
@property (nonatomic, strong) NSArray *privilege;   // 特权(不知道是啥)

/**
 这个是我的信息
    city = Qingdao;
    country = CN;
    headimgurl = "http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erO3q5AfkZzUFKictzMEV1FicmKicmzichbib7HJXAFXQsuYzwcbpDtHkXpWBibAKhtbBYkzADByn5nLbBg/132";
    language = "zh_CN";
    nickname = "\U90d1\U4e1a\U5f3a";
    openid = "oabqWwXatwfCf7FtlhaAjOwgX-rA";
    privilege =     (
    );
    province = Shandong;
    sex = 1;
    unionid = "o_2Jdw9JDp8Pvo9dxLh2uD1VVRac";
 */

@end
