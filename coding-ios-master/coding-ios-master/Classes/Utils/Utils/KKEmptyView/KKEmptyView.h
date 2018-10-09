//
//  KKEmptyView.h
//  coding-ios-master
//
//  Created by MAC on 2018/4/20.
//  Copyright © 2018年 kk. All rights reserved.
//

#pragma mark - typedef
// 空界面类型枚举
typedef enum : NSUInteger {
    KKEmptyViewTypeCommon,    // 通用空界面
    KKEmptyViewTypeFail,      // 页面加载失败
    KKEmptyViewTypeNetFail,   // 网络请求失败
    KKEmptyViewTypeSystemBusy,  // 抱歉！系统繁忙
    KKEmptyViewTypeCart,      // 暂无商品
    KKEmptyViewTypeLoading    // 加载中……
} KKEmptyViewType;

// 空界面里面事件类型
typedef enum : NSUInteger {
    KKEmptyViewEventTypeBuy,      // 无商品
    KKEmptyViewEventTypeReload    // 重新加载
} KKEmptyViewEventType;

// 页面的展示样式(文字 / 文字+图片 / 文字+图片+按钮)
typedef enum : NSUInteger {
    KKEmptyViewLayoutTypeTitle,           // 文字
    KKEmptyViewLayoutTypeTitleIcon,       // 文字+图片
    KKEmptyViewLayoutTypeTitleIconButton, // 文字+图片+按钮
} KKEmptyViewLayoutType;

typedef void (^EmptyViewEventBlock)(KKEmptyViewEventType eventType);

#pragma mark - 声明
@interface KKEmptyView : UIView

/// 初始化空视图
- (instancetype)initEmptyViewType:(KKEmptyViewType)emptyViewType showInView:(UIView *)view eventBlock:(EmptyViewEventBlock)eventBlock;
/// 初始化空视图
- (instancetype)initEmptyViewType:(KKEmptyViewType)emptyViewType showInView:(UIView *)view backButton:(BOOL)backButton eventBlock:(EmptyViewEventBlock)eventBlock;
/// 显示
- (void)show;
/// 隐藏
- (void)hide;

@end
