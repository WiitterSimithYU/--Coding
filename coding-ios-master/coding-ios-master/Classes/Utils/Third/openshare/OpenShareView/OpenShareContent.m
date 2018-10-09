//
//  OpenShareContent.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/23.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "OpenShareContent.h"

#pragma mark - 声明
@interface OpenShareContent ()

@property (nonatomic, strong) UIScrollView *scroll;
@property (nonatomic, strong) UIButton *cancle;

@end

#pragma mark - 实现
@implementation OpenShareContent

#pragma mark - 初始化
+ (instancetype)initWithFrame:(CGRect)frame {
    OpenShareContent *view = [OpenShareContent loadCode:frame];
    [view createView];
    return view;
}
- (void)createView {
    [self setBackgroundColor:[UIColor whiteColor]];
    [self scroll];
    [self cancle];
}

- (UIScrollView *)scroll {
    if (!_scroll) {
        _scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height - self.cancle.height)];
        [_scroll setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_scroll];
        
        NSArray *names = @[@"QQ",@"微信",@"微博"];
        NSArray *icons = @[@"00currency_share_icon01",@"00currency_share_icon02",@"00currency_share_icon03"];
        for (int i=0; i<names.count; i++) {
            NSInteger row = 4;
            NSInteger col = 2;
            
            
            
//            UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
//            view.frame = CGRectMake(i * SCREEN_WIDTH / 3, 0, SCREEN_WIDTH / 3, _scroll.height);
//            view.tag = i;
//            [view addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//            [_scroll addSubview:view];
//
//            UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, view.width, view.height / 2)];
//            image.centerY = view.height / 2 - 10;
//            image.image = [UIImage imageNamed:icons[i]];
//            image.contentMode = UIViewContentModeScaleAspectFit;
//            [view addSubview:image];
//
//            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(image.frame), view.width, 20)];
//            label.text = names[i];
//            label.font = [UIFont systemFontOfSize:AdjustFont(26) weight:UIFontWeightThin];
//            label.textColor = kColor_Text_Black;
//            label.textAlignment = NSTextAlignmentCenter;
//            [view addSubview:label];
        }
    }
    return _scroll;
}
- (UIButton *)cancle {
    if (!_cancle) {
        _cancle = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancle.frame = CGRectMake(0, self.height - 40, self.width, 40);
        _cancle.backgroundColor = ColorBg;
        _cancle.titleLabel.font = [UIFont boldSystemFontOfSize:adjustFont(16)];
        [_cancle setTitle:@"取消" forState:UIControlStateNormal];
        [self addSubview:_cancle];
    }
    return _cancle;
}


@end
