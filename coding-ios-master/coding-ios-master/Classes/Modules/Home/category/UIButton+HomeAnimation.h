//
//  UIButton+HomeAnimation.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/9.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - enum
typedef void (^HomeAnimationBlock)(POPAnimation *anim, BOOL finished);
// 动画样式
typedef NS_ENUM(NSInteger, HomePushButtonStyle) {
    HomePushButtonStyleMove,  // 移动
    HomePushButtonStyleAlpha, // 透明度
    HomePushButtonStyleScale, // 比例
};
// 显示/隐藏
typedef NS_ENUM(NSInteger, HomePushButtonAnimation) {
    HomePushButtonAnimationShow, // 显示
    HomePushButtonAnimationHide, // 隐藏
};
// 三角形位置
typedef NS_ENUM(NSInteger, HomePushButtonTriangle) {
    HomePushButtonTriangleTop,   // 顶部
    HomePushButtonTriangleLeft,  // 左边
    HomePushButtonTriangleRight, // 右边
};
// 按钮
typedef NS_ENUM(NSInteger, HomePushBtn) {
    HomePushBtnOne,   // 按钮1
    HomePushBtnTwo,   // 按钮2
};

#pragma mark - 声明
@interface UIButton (HomeAnimation)

/// 添加动画
- (void)addAnimationWithStyle:(HomePushButtonStyle)style
                    animation:(HomePushButtonAnimation)animation;
- (void)addAnimationWithStyle:(HomePushButtonStyle)style
                    animation:(HomePushButtonAnimation)animation
                     position:(HomePushButtonTriangle)position;
- (void)addAnimationWithStyle:(HomePushButtonStyle)style
                    animation:(HomePushButtonAnimation)animation
                     position:(HomePushButtonTriangle)position
                       button:(HomePushBtn)button;
- (void)addAnimationWithStyle:(HomePushButtonStyle)style
                    animation:(HomePushButtonAnimation)animation
                      toValue:(CGPoint)toValue;
- (void)addAnimationWithStyle:(HomePushButtonStyle)style
                    animation:(HomePushButtonAnimation)animation
                      toValue:(CGPoint)toValue
                     complete:(HomeAnimationBlock)complete;
- (void)addAnimationWithStyle:(HomePushButtonStyle)style
                    animation:(HomePushButtonAnimation)animation
                     position:(HomePushButtonTriangle)position
                       button:(HomePushBtn)button
                     complete:(HomeAnimationBlock)complete;
- (void)addAnimationWithStyle:(HomePushButtonStyle)style
                    animation:(HomePushButtonAnimation)animation
                     position:(HomePushButtonTriangle)position
                       button:(HomePushBtn)button
                      toValue:(CGPoint)toValue
                     complete:(HomeAnimationBlock)complete;


// 创建比例动画
- (void)createScale:(CGPoint)scale name:(NSString *)name duration:(NSTimeInterval)duration;
- (void)createScale:(CGPoint)scale name:(NSString *)name duration:(NSTimeInterval)duration complete:(HomeAnimationBlock)complete;

@end
