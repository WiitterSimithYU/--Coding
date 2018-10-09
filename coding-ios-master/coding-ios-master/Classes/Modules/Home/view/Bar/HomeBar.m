//
//  HomeBar.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/8.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeBar.h"

#pragma mark - 声明
@interface HomeBar()

@property (nonatomic, strong) UIButton *menu;

@end

#pragma mark - 实现
@implementation HomeBar

- (void)initUI {
    [self menu];
}
- (UIButton *)menu {
    if (!_menu) {
        _menu = [UIButton buttonWithType:UIButtonTypeCustom];
        _menu.frame = CGRectMake(countcoordinatesX(20), StatusBarHeight, 30, 30);
        _menu.backgroundColor = [UIColor redColor];
        [self addSubview:_menu];
    }
    return _menu;
}

@end
