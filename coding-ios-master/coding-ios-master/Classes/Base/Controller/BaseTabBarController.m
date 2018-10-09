//
//  BaseTabBarController.m
//  iOS
//
//  Created by RY on 2018/3/19.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseTabBar.h"

#pragma mark - 声明
@interface BaseTabBarController ()

@end

#pragma mark - 实现
@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
//    StoreController *article = [[StoreController alloc] init];
//    [self addChildViewController:article title:@"发现" image:@"tabbar_detail_26x26_" selImage:@"tabbar_detail_s_26x26_"];
//    ShelfController *shelf = [[ShelfController alloc] init];
//    [self addChildViewController:shelf title:@"我的" image:@"tabbar_discover_26x26_" selImage:@"tabbar_discover_s_26x26_"];
//    MineController *mine = [[MineController alloc] init];
//    [self addChildViewController:mine title:@"账号" image:@"tabbar_settings_24x24_" selImage:@"tabbar_settings_s_24x24_"];
    
    // 自定义TabBar
    BaseTabBar *tabBar = [[BaseTabBar alloc] init];
//    tabBar.composeButtonClick = ^{
//        NSLog(@"点击按钮,弹出菜单");
//    };
    
    [self setValue:tabBar forKey:@"tabBar"];
    [self setSelectedIndex:0];
    
    
//    UIColor *color = [UIColor whiteColor];
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddRect(path, NULL, self.tabBar.bounds);
//    self.tabBar.layer.shadowPath = path;
//    CGPathCloseSubpath(path);
//    CGPathRelease(path);
//
//    self.tabBar.layer.shadowColor = color.CGColor;
//    self.tabBar.layer.shadowOffset = CGSizeMake(2, 2);
//    self.tabBar.layer.shadowRadius = 5;
//    self.tabBar.layer.shadowOpacity = 0.6;
//    self.tabBar.clipsToBounds = NO;
    
}

- (void)addChildViewController:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selImage:(NSString *)selImage {
    static NSInteger index = 0;
    childVc.tabBarItem.title = title;
    childVc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.tag = index;
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[[UIColor whiteColor] colorWithAlphaComponent:0.5], NSForegroundColorAttributeName, [UIFont systemFontOfSize:adjustFont(10)],NSFontAttributeName,nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:adjustFont(10)],NSFontAttributeName,nil] forState:UIControlStateSelected];
    index++;
    // 让子控制器包装一个导航控制器
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}


- (void)hideTabbar:(BOOL)hidden {
    [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        for (UIView *view in self.view.subviews) {
            if ([view isKindOfClass:[UITabBar class]]) {
                if (hidden) {
                    CGRect frame = view.frame;
                    frame.origin.y = ScreenHeight;
                    view.frame = frame;
                } else {
                    CGRect frame = view.frame;
                    frame.origin.y = ScreenHeight - TabbarHeight;
                    view.frame = frame;
                }
            }
        }
    } completion:^(BOOL finished) {
        
    }];
}

@end
