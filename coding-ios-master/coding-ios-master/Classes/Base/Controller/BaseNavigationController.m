//
//  BaseNavigationController.m
//  iOS
//
//  Created by RY on 2018/3/19.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "BaseNavigationController.h"

#pragma mark - 声明
@interface BaseNavigationController ()

@end

#pragma mark - 实现
@implementation BaseNavigationController

#pragma mark - 初始化
+ (instancetype)initWithRootViewController:(UIViewController *)vc {
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
    nav.jz_navigationBarTransitionStyle = JZNavigationBarTransitionStyleSystem;
//    UINavigationBar *navigationBar = nav.navigationBar;
//    [navigationBar setShadowImage:[UIImage createImageWithColor:[UIColor clearColor]]];
    return nav;
}
//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    if (self.viewControllers.count != 1) {
//        viewController.hidesBottomBarWhenPushed = YES;
//    } else {
//        viewController.hidesBottomBarWhenPushed = NO;
//    }
//    [super pushViewController:viewController animated:animated];
//}

@end

