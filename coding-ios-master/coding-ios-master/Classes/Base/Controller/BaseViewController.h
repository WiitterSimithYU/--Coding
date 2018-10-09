//
//  BaseViewController.h
//  iOS
//
//  Created by RY on 2018/3/19.
//  Copyright © 2018年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

// 标题
@property (nonatomic, strong) NSString *navTitle;
// 是否允许侧滑返回
@property (nonatomic, assign, getter=isAllowBack) BOOL allowPanBack;

- (void)setLeftClick:(NSArray<NSArray *> *)datas;
- (void)leftItemPressed:(NSInteger)index;
- (void)setRightClick:(NSArray<NSArray *> *)datas;
- (void)rightItemPressed:(NSInteger)index;

- (void)hideNavigationBarLine;
- (void)showNavigationBarLine;

@end
