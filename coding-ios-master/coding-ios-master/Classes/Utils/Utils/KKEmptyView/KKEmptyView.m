//
//  KKEmptyView.m
//  FzShop
//  空界面
//  Created by Silence on 2016/11/7.
//  Copyright © 2016年 FzShop. All rights reserved.
//

#import "KKEmptyView.h"

#pragma mark - 声明
@interface KKEmptyView() {
    UIStatusBarStyle _lastBarStyle;
}

@property (strong, nonatomic) EmptyViewEventBlock eventBlock;   // 点击事件处理
@property (nonatomic, assign) KKEmptyViewType emptyViewType;    // 空界面类型枚举
@property (weak  , nonatomic) UIView *inView;
@property (nonatomic, strong) UIButton *back;       // 返回按钮
@property (nonatomic, strong) UILabel *title;       // 描述文字
@property (nonatomic, strong) UIImageView *icon;    // 图片
@property (nonatomic, strong) UIButton *dosome;     // 按钮
@property (nonatomic, assign, getter=isDisplay) BOOL display;    // 是否显示

@end

#pragma mark - 实现
@implementation KKEmptyView

#pragma mark - 初始化
- (instancetype)initEmptyViewType:(KKEmptyViewType)emptyViewType showInView:(UIView *)view eventBlock:(EmptyViewEventBlock)eventBlock {
    if (self = [super init]) {
        self.inView = view;
        self.eventBlock = eventBlock;
        self.emptyViewType = emptyViewType;
        [self initView];
    }
    return self;
}
- (instancetype)initEmptyViewType:(KKEmptyViewType)emptyViewType showInView:(UIView *)view backButton:(BOOL)backButton eventBlock:(EmptyViewEventBlock)eventBlock {
    KKEmptyView *single = [[KKEmptyView alloc] initEmptyViewType:emptyViewType showInView:view eventBlock:eventBlock];
    if (backButton == YES) {
        [single back];
    }
    return single;
}


// 返回按钮
- (UIButton *)back {
    if (!_back) {
        _back = [UIButton buttonWithType:UIButtonTypeCustom];
        _back.frame = CGRectMake(countcoordinatesX(15), StatusBarHeight + countcoordinatesX(5), 30, 30);
        [_back setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        __weak typeof(self) weak = self;
        [_back addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            [weak.viewController.navigationController popViewControllerAnimated:YES];
        }];
        [self addSubview:_back];
    }
    return _back;
}
// 标题
- (UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc] init];
        _title.textAlignment = NSTextAlignmentCenter;
        _title.alpha = 0;
        [self addSubview:_title];
    }
    return _title;
}
// 图片
- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.userInteractionEnabled = YES;
        _icon.alpha = 0;
        [self addSubview:_icon];
    }
    return _icon;
}
// 执行操作
- (UIButton *)dosome {
    if (!_dosome) {
        _dosome = [UIButton buttonWithType:UIButtonTypeCustom];
        _dosome.alpha = 0;
        _dosome.titleLabel.font = [UIFont systemFontOfSize:14];
        [_dosome setTitleColor:ColorTextBold forState:UIControlStateNormal];
        [_dosome.layer setCornerRadius:3];
        [_dosome cornerRadius:3 strokeSize:0.5 color:ColorTextThin];
        [self addSubview:_dosome];
    }
    return _dosome;
}

// 设置控件 Layout
- (void)createLayout:(KKEmptyViewLayoutType)type {
    [self title];
    [self icon];
    [self dosome];
    
    CGFloat width = self.inView.width;
    CGFloat height = self.inView.height;
    
    if (type == KKEmptyViewLayoutTypeTitle) {
        _title.alpha = 1;
        _icon.alpha = 0;
        _dosome.alpha = 0;
        _title.textColor = ColorTextThin;
        _title.font = [UIFont systemFontOfSize:15];
        _title.frame = CGRectMake(0, 0, width, 20);
        _title.center = CGPointMake(width / 2, height / 2 - 16);
    }
    else if (type == KKEmptyViewLayoutTypeTitleIcon) {
        _title.alpha = 1;
        _icon.alpha = 1;
        _dosome.alpha = 0;
        _title.textColor = ColorTextThin;
        _title.font = [UIFont systemFontOfSize:14];
        
        _title.frame = CGRectMake(0, 0, width, 20);
        _title.center = CGPointMake(width / 2, height / 2 + 16);
        _icon.frame = CGRectMake(0, 0, width / 3, width / 3);
        _icon.centerX = width / 2;
        _icon.bottom = _title.top - countcoordinatesX(14);
    }
    else if (type == KKEmptyViewLayoutTypeTitleIconButton) {
        _title.alpha = 1;
        _icon.alpha = 1;
        _dosome.alpha = 1;
        _title.textColor = ColorTextThin;
        _title.font = [UIFont systemFontOfSize:14];
        
        _title.frame = CGRectMake(0, 0, width, 20);
        _title.center = CGPointMake(width / 2, height / 2);
        _icon.frame = CGRectMake(0, 0, width / 3, width / 3);
        _icon.centerX = width / 2;
        _icon.bottom = _title.top - countcoordinatesX(14);
        _dosome.frame = CGRectMake(0, 0, 100, 40);
        _dosome.centerX = width / 2;
        _dosome.top = _title.bottom + countcoordinatesX(28);
    }
}


#pragma mark - 动画
- (void)show {
    _display = YES;
    _lastBarStyle = [UIApplication sharedApplication].statusBarStyle;
    [self.inView setAlpha:0];
    [self setFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.inView addSubview:self];
    [self.inView setAlpha:1];
}
- (void)smallShow {
    _display = YES;
    _lastBarStyle = [UIApplication sharedApplication].statusBarStyle;
    [self.inView setAlpha:0];
    [self setFrame:CGRectMake(0, countcoordinatesX(150), ScreenWidth, ScreenHeight-countcoordinatesX(150))];
    [self.inView addSubview:self];
    [self.inView setAlpha:1];
    
}
- (void)hide {
    _display = NO;
    [self removeFromSuperview];
}

#pragma mark - 生成视图内容的私有方法

- (void)initView {
    [self setBackgroundColor:ColorBg];
    // 加载中……
    if (self.emptyViewType == KKEmptyViewTypeLoading) {
        // Layout
        [self createLayout:KKEmptyViewLayoutTypeTitle];
        // 数据
        _title.text = @"数据加载中...";
    }
    // 网络连接出错
    else if (self.emptyViewType == KKEmptyViewTypeNetFail) {
        // Layout
        [self createLayout:KKEmptyViewLayoutTypeTitleIcon];
        // 数据
        _title.text = @"网络连接出错";
        _icon.image = [UIImage imageNamed:@"00currency_icon49"];
        // 操作
        __weak typeof(self) weak = self;
        [_icon addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            weak.eventBlock(KKEmptyViewEventTypeReload);
        }];
    }
    // 暂无商品
    else if (self.emptyViewType == KKEmptyViewTypeCart) {
        // Layout
        [self createLayout:KKEmptyViewLayoutTypeTitleIconButton];
        // 数据
        _title.text = @"您的购物车空空如也～";
        _title.textColor = ColorTextThin;
        _icon.image = [UIImage imageNamed:@"00currency_icon48"];
        [_dosome setTitle:@"去逛逛" forState:UIControlStateNormal];
        
        // 操作
        __weak typeof(self) weak = self;
        [_dosome addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            weak.eventBlock(KKEmptyViewEventTypeBuy);
        }];
    }
    else {
        // Layout
        [self createLayout:KKEmptyViewLayoutTypeTitleIcon];
        // 数据
        _title.text = @"暂无数据";
        _icon.image = [UIImage imageNamed:@"00currency_icon48"];
        // 操作
        __weak typeof(self) weak = self;
        [_icon addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            weak.eventBlock(KKEmptyViewEventTypeReload);
        }];
    }
}

@end

