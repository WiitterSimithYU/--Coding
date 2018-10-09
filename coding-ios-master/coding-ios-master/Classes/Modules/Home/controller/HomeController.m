//
//  HomeController.m
//  coding-ios-master
//
//  Created by MAC on 2018/6/7.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeController.h"
#import "HomeView.h"

#pragma mark - 声明
@interface HomeController ()

@property (nonatomic, strong) HomeView *homev;

@end

#pragma mark - 实现
@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)loadView {
    self.view = [self homev];
}
- (HomeView *)homev {
    if (!_homev) {
        _homev = [HomeView loadCode:ScreenBounds];
    }
    return _homev;
}


@end
