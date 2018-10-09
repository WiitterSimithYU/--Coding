//
//  BaseView.m
//  KKTest
//
//  Created by RY on 17/6/12.
//  Copyright © 2017年 OuDa. All rights reserved.
//

#import "BaseView.h"

#pragma mark - 实现
@implementation BaseView

// 加载第一个nib
+ (instancetype)loadFirstNib:(CGRect)frame {
    BaseView *view = [self loadNib:0 frame:frame];
    [view initUI];
    return view;
}
// 加载最后一个nib
+ (instancetype)loadLastNib:(CGRect)frame {
    NSInteger index = [self getViews].count - 1;
    BaseView *view = [self loadNib:index frame:frame];
    [view initUI];
    return view;
}
// 从代码创建view
+ (instancetype)loadCode:(CGRect)frame {
    BaseView *view = [[[self class] alloc] initWithFrame:frame];
    [view initUI];
    return view;
}
// 加载指定nib
+ (instancetype)loadNib:(NSInteger)index frame:(CGRect)frame {
    NSString *name = NSStringFromClass(self);
    BaseView *view = [[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil][index];
    view.frame = frame;
    [view initUI];
    return view;
}
// 获取XIB中View个数
+ (NSArray *)getViews {
    NSString *name = NSStringFromClass(self);
    return [[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil];
}

// 初始化UI
- (void)initUI {
    
}

- (void)showEmptyView:(KKEmptyViewType)emptyViewType eventBlock:(EmptyViewEventBlock)eventBlock {
    [self hideEmptyView];
    self.emptyView = [[KKEmptyView alloc] initEmptyViewType:emptyViewType showInView:self eventBlock:eventBlock];
    [self.emptyView show];
}
- (void)showEmptyView:(KKEmptyViewType)emptyViewType backButton:(BOOL)backButton eventBlock:(EmptyViewEventBlock)eventBlock {
    [self hideEmptyView];
    self.emptyView = [[KKEmptyView alloc] initEmptyViewType:emptyViewType showInView:self backButton:backButton eventBlock:eventBlock];
    [self.emptyView show];
}
- (void)showEmptyView:(KKEmptyViewType)emptyViewType inView:(UIView *)inview eventBlock:(EmptyViewEventBlock)eventBlock {
    [self hideEmptyView];
    self.emptyView = [[KKEmptyView alloc] initEmptyViewType:emptyViewType showInView:inview eventBlock:eventBlock];
    [self.emptyView show];
}
- (void)hideEmptyView {
    if (self.emptyView) {
        [self.emptyView hide];
        self.emptyView = nil;
    }
}

@end

