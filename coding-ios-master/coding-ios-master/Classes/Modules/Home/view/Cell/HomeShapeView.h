//
//  HomeShapeView.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/7.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"

#pragma mark - NS_ENUM
typedef NS_ENUM(NSInteger, HomeShapeStatus) {
    HomeShapeStatusNotDownload,   // 未下载
    HomeShapeStatusDownloading,   // 下载中
    HomeShapeStatusDownloaded,    // 下载完成
};

#pragma mark - 声明
@interface HomeShapeView : BaseView

/// 状态
@property (nonatomic, assign) HomeShapeStatus status;
/// 圆圈颜色
@property (nonatomic, strong) UIColor *shapeColor;
/// 进度
@property (nonatomic, assign) CGFloat progress;

@end
