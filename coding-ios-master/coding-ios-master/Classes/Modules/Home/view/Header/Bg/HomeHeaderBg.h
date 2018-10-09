//
//  HomeHeaderBg.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/10.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"

#pragma mark - enum
typedef NS_ENUM(NSInteger, HomeHeaderBgType) {
    HomeHeaderBgTypeDefault,  // 默认
    HomeHeaderBgTypeSpeed,    // 设置
    HomeHeaderBgTypeControl,  // 控制
};

#pragma mark - 声明
@interface HomeHeaderBg : BaseView

/// 背景色
@property (nonatomic, strong) UIColor *bgColor;
/// 填充样式
@property (nonatomic, assign) HomeHeaderBgType type;

@end
