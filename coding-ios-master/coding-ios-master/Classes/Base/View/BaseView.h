//
//  BaseView.h
//  KKTest
//
//  Created by RY on 17/6/12.
//  Copyright © 2017年 OuDa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKEmptyView.h"

@interface BaseView : UIView

@property (nonatomic, strong) KKEmptyView *emptyView;

//==================================== 加载 ====================================//
/// 加载第一个nib
+ (instancetype)loadFirstNib:(CGRect)frame;

/// 加载最后一个nib
+ (instancetype)loadLastNib:(CGRect)frame;

/// 从代码创建view
+ (instancetype)loadCode:(CGRect)frame;

/// 加载指定nib
+ (instancetype)loadNib:(NSInteger)index frame:(CGRect)frame;



/// 初始化UI
- (void)initUI;


//==================================== 空白 ====================================//
/// 初始化空视图
- (void)showEmptyView:(KKEmptyViewType)emptyViewType eventBlock:(EmptyViewEventBlock)eventBlock;
/// 初始化空视图
- (void)showEmptyView:(KKEmptyViewType)emptyViewType backButton:(BOOL)backButton eventBlock:(EmptyViewEventBlock)eventBlock;
/// 初始化空视图
- (void)showEmptyView:(KKEmptyViewType)emptyViewType inView:(UIView *)inview eventBlock:(EmptyViewEventBlock)eventBlock;
/// 隐藏视图
- (void)hideEmptyView;

@end
