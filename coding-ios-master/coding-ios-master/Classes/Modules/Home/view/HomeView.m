//
//  HomeView.m
//  coding-ios-master
//
//  Created by MAC on 2018/6/7.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeView.h"
#import "HomeHeader.h"
#import "HomeCell.h"
#import "HomeBar.h"

#pragma mark - 声明
@interface HomeView ()<HomeHeaderDelegate>

@property (nonatomic, strong) HomeBar *bar;
@property (nonatomic, strong) HomeHeader *header;
@property (nonatomic, strong) UIScrollView *scroll;
@property (nonatomic, strong) NSArray *data;

@end

#pragma mark - 实现
@implementation HomeView

#pragma mark - 初始化
- (void)initUI {
    [self header];
    [self scroll];
//    [self bar];
    [self bringSubviewToFront:_header];
    [self bringSubviewToFront:_bar];
    [self createScrollView];
}
- (HomeBar *)bar {
    if (!_bar) {
        _bar = [HomeBar loadCode:CGRectMake(0, 0, ScreenWidth, NavigationBarHeight)];
        [self addSubview:_bar];
    }
    return _bar;
}
- (HomeHeader *)header {
    if (!_header) {
        _header = [HomeHeader loadCode:CGRectMake(0, 0, ScreenWidth, ScreenWidth)];
        _header.bgColor = [UIColor grayColor];
        _header.delegate = self;
        [self addSubview:_header];
    }
    return _header;
}
- (UIScrollView *)scroll {
    if (!_scroll) {
        _scroll = [[UIScrollView alloc] initWithFrame:ScreenBounds];
        _scroll.contentInset = UIEdgeInsetsMake(self.header.height, 0, 0, 0);
        _scroll.showsVerticalScrollIndicator = NO;
        [self addSubview:_scroll];
    }
    return _scroll;
}
- (void)createScrollView {
    NSArray *arr = @[@"包菜",@"冬瓜",@"冬笋",@"红薯",@"胡萝卜",
                     @"花菜",@"黄瓜",@"茄子",@"辣椒",@"南瓜",
                     @"藕",@"秋葵",@"山药",@"蔬菜集",@"土豆",
                     @"豌豆",@"西红柿",@"西蓝花",@"洋葱",@"玉米"];
    for (int i=0; i<arr.count; i++) {
        NSInteger count = 4;
        NSInteger row = i / count;
        NSInteger col = i % count;
        HomeCell *cell = [HomeCell loadCode:({
            CGFloat width = ScreenWidth / count;
            CGFloat height = width + 10;
            CGFloat left = col * width;
            CGFloat top = row * height;
            CGRectMake(left, top, width, height);
        })];
        [cell setData:arr[i]];
        [cell setShapeColor:[UIColor orangeColor]];
        [self.scroll addSubview:cell];
        [self.scroll setContentSize:CGSizeMake(ScreenWidth, CGRectGetMaxY(cell.frame))];
    }
}

#pragma mark - HomeHeaderDelegate
// 点击了内三角, 更改高度
- (void)homeHeader:(HomeHeader *)header didClickInTriangle:(CAShapeLayer *)triangle {
    CGFloat headerH = self.header.height < ScreenWidth / 750.f * 1030 ? ScreenWidth / 750.f * 1030 : ScreenWidth;
    CGFloat moveH = _scroll.contentOffset.y - (headerH - _header.height);
    [_header setType:headerH == ScreenWidth / 750.f * 1030 ? HomeHeaderBgTypeSpeed : HomeHeaderBgTypeDefault];
    [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [_header setHeight:headerH];
        [_scroll setContentInset:UIEdgeInsetsMake(headerH, 0, 0, 0)];
        [_scroll setContentOffset:CGPointMake(0, moveH) animated:NO];
    } completion:^(BOOL finished) {
        
    }];
}
/// 点击了三个按钮
- (void)homeHeader:(HomeHeader *)header didTapButton:(HomePushButton *)button {
    NSLog(@"123");
}
/// 点击速率按钮
- (void)homeHeader:(HomeHeader *)header didTapSpeed:(UIButton *)speed {
    CGFloat headerH = self.header.height < ScreenWidth / 750.f * 1030 ? ScreenWidth / 750.f * 1030 : ScreenWidth;
    CGFloat moveH = _scroll.contentOffset.y - (headerH - _header.height);
    [_header setType:headerH == ScreenWidth / 750.f * 1030 ? HomeHeaderBgTypeSpeed : HomeHeaderBgTypeDefault];
    [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [_header setHeight:headerH];
        [_scroll setContentInset:UIEdgeInsetsMake(headerH, 0, 0, 0)];
        [_scroll setContentOffset:CGPointMake(0, moveH) animated:NO];
    } completion:^(BOOL finished) {
        
    }];
}
/// 点击控制按钮
- (void)homeHeader:(HomeHeader *)header didTapControl:(UIButton *)control {
    CGFloat headerH = self.header.height != ScreenHeight ? ScreenHeight : ScreenWidth;
    CGFloat moveH = _scroll.contentOffset.y - (headerH - _header.height);
    [_header setType:headerH == ScreenHeight ? HomeHeaderBgTypeControl : HomeHeaderBgTypeDefault];
    [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [_header setHeight:headerH];
        [_scroll setContentInset:UIEdgeInsetsMake(headerH, 0, 0, 0)];
        [_scroll setContentOffset:CGPointMake(0, moveH) animated:NO];
    } completion:^(BOOL finished) {
        
    }];
}
/// 点击了关闭按钮
- (void)homeHeader:(HomeHeader *)header didTapClose:(UIButton *)close {
    CGFloat headerH = ScreenWidth;
    CGFloat moveH = _scroll.contentOffset.y - (headerH - _header.height);
    [_header setType:HomeHeaderBgTypeDefault];
    [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [_header setHeight:headerH];
        [_scroll setContentInset:UIEdgeInsetsMake(headerH, 0, 0, 0)];
        [_scroll setContentOffset:CGPointMake(0, moveH) animated:NO];
    } completion:^(BOOL finished) {
        
    }];
}

/// 点击音量调节
- (void)homeHeader:(HomeHeader *)header didClickMusic:(UIButton *)music {
    CGFloat headerH = ScreenWidth / 750.f * 1030;
    CGFloat moveH = _scroll.contentOffset.y - (headerH - _header.height);
    [_header setType:HomeHeaderBgTypeSpeed];
    [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [_header setHeight:headerH];
        [_scroll setContentInset:UIEdgeInsetsMake(headerH, 0, 0, 0)];
        [_scroll setContentOffset:CGPointMake(0, moveH) animated:NO];
    } completion:^(BOOL finished) {
        
    }];
}




@end

