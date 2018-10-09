//
//  BaseViewController.m
//  iOS
//
//  Created by RY on 2018/3/19.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "BaseViewController.h"

#pragma mark - 声明
@interface BaseViewController ()

@end

#pragma mark - 实现
@implementation BaseViewController

#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    _allowPanBack = YES;
    self.navigationController.jz_navigationBarTransitionStyle = JZNavigationBarTransitionStyleSystem;
    self.navigationController.jz_navigationBarSize = CGSizeMake(ScreenWidth, 100);
    [self setJz_navigationBarTintColor:ColorTextBold];
}
- (void)setNavTitle:(NSString *)navTitle {
    _navTitle = navTitle;
    UIFont *font = [UIFont boldSystemFontOfSize:adjustFont(16)];
    CGSize maxSize = [navTitle sizeWithMaxSize:CGSizeMake(MAXFLOAT, 0) font:font];
    UIButton *btn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.titleLabel.font = font;
        [btn setFrame:CGRectMake(0, 0, maxSize.width, 40)];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitle:navTitle forState:UIControlStateNormal];
        btn;
    });
    self.navigationItem.titleView = btn;
}


- (void)setLeftClick:(NSArray<NSArray *> *)datas {
    NSMutableArray<UIBarButtonItem *> *items = [[NSMutableArray alloc] init];
    for (int i=0; i<datas.count; i++) {
        NSString *image = datas[i][0];
        NSString *title = datas[i][1];
        UIFont  *font   = [UIFont systemFontOfSize:14];
        CGSize  titleSize = [title sizeWithMaxSize:CGSizeMake(MAXFLOAT, 0) font:font];
        CGSize  imageSize = image.length == 0 ? CGSizeMake(0, 20) : CGSizeMake(20, 20);
        CGFloat padding   = 3;
        
        YLButton *btn = ({
            YLButton *btn = [YLButton buttonWithType:UIButtonTypeCustom];
            [btn setTag:i];
            if (image && image.length != 0) {
                [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
            }
            [btn setTitle:title forState:UIControlStateNormal];
            [btn.titleLabel setFont:font];
            [btn setTitleColor:MediumColor forState:UIControlStateNormal];
            [btn setImageRect:CGRectMake(0, (44 - imageSize.height) / 2, imageSize.width, imageSize.height)];
            [btn setTitleRect:CGRectMake(imageSize.width + padding, 0, titleSize.width, 44)];
            btn;
        });
        
        UIView *view = ({
            UIView *view = [[UIView alloc] init];
            [view setTag:i];
            [view setFrame:CGRectMake(0, 0, imageSize.width + titleSize.width + padding, 44)];
            [view addSubview:btn];
            view;
        });
        
        UIBarButtonItem *item = ({
            UILongPressGestureRecognizer *tap = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(leftBtnPressed:)];
            tap.minimumPressDuration = 0.1f;
            [view addGestureRecognizer:tap];
            UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:view];
            item;
        });
        [items addObject:item];
    }
    [self.navigationItem setLeftBarButtonItems:items];
}
- (void)leftBtnPressed:(UITapGestureRecognizer *)tap {
    UIView *view = tap.view;
    [self leftItemPressed:view.tag];
}
- (void)leftItemPressed:(NSInteger)index {
    NSLog(@"left");
}


- (void)setRightClick:(NSArray<NSArray *> *)datas {
    NSMutableArray<UIBarButtonItem *> *items = [[NSMutableArray alloc] init];
    for (int i=0; i<datas.count; i++) {
        NSString *image = datas[i][0];
        NSString *title = datas[i][1];
        UIFont *font = [UIFont systemFontOfSize:14];
        CGSize titleSize = [title sizeWithMaxSize:CGSizeMake(MAXFLOAT, 0) font:font];
        CGSize imageSize = image.length == 0 ? CGSizeMake(0, 20) : CGSizeMake(20, 20);
        CGFloat padding = 3;
        
        YLButton *btn = ({
            YLButton *btn = [YLButton buttonWithType:UIButtonTypeCustom];
            [btn setTag:i];
            if (image && image.length != 0) {
                [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
            }
            [btn setTitle:title forState:UIControlStateNormal];
            [btn.titleLabel setFont:font];
            [btn setTitleColor:MediumColor forState:UIControlStateNormal];
            [btn setImageRect:CGRectMake(0, (44 - imageSize.height) / 2, imageSize.width, imageSize.height)];
            [btn setTitleRect:CGRectMake(imageSize.width + padding, 0, titleSize.width, 44)];
            btn;
        });
        
        UIView *view = ({
            UIView *view = [[UIView alloc] init];
            [view setTag:i];
            [view setFrame:CGRectMake(0, 0, imageSize.width + titleSize.width + padding, 44)];
            [view addSubview:btn];
            view;
        });
        
        UIBarButtonItem *item = ({
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightBtnPressed:)];
            [view addGestureRecognizer:tap];
            UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:view];
            item;
        });
        [items addObject:item];
    }
    
    
    
    
    [self.navigationItem setRightBarButtonItems:items];
}
- (void)rightBtnPressed:(UITapGestureRecognizer *)tap {
    UIView *view = tap.view;
    [self rightItemPressed:view.tag];
}
- (void)rightItemPressed:(NSInteger)index {
    NSLog(@"right");
}


- (void)setAllowPanBack:(BOOL)allowPanBack {
    _allowPanBack = allowPanBack;
}


- (instancetype)init {
    if (self = [super init]) {
//        if ([self isKindOfClass:[ShelfController class]] ||
//            [self isKindOfClass:[StoreController class]] ||
//            [self isKindOfClass:[MineController class]]) {
//            self.hidesBottomBarWhenPushed = NO;
////            [(BaseTabBarController *)self.navigationController.tabBarController hideTabbar:NO];
//        } else {
////            [(BaseTabBarController *)self.navigationController.tabBarController hideTabbar:YES];
//            self.hidesBottomBarWhenPushed = YES;
//        }
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self hideNavigationBarLine];
    
}


- (void)hideNavigationBarLine {
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}
- (void)showNavigationBarLine {
//    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

// 找到导航栏最下面黑线视图
- (UIImageView *)getLineViewInNavigationBar:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self getLineViewInNavigationBar:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}




@end

