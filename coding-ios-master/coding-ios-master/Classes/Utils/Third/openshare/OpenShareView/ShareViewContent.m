//
//  ShareViewContent.m
//  ZhongLv
//
//  Created by MAC on 2018/5/11.
//  Copyright © 2018年 Zhonglv. All rights reserved.
//

#import "ShareViewContent.h"
#import "ShareViewSubContent.h"

#pragma mark - 声明
@interface ShareViewContent ()

@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UIScrollView *scroll;
@property (nonatomic, strong) UIView *line;

@end

#pragma mark - 实现
@implementation ShareViewContent

#pragma mark - 初始化
+ (instancetype)initWithFrame:(CGRect)frame {
    ShareViewContent *view = [[ShareViewContent alloc] initWithFrame:frame];
    [view createView];
    return view;
}
- (void)createView {
    [self.title shadowWithColor:kColor_Text_Gary offset:CGSizeMake(0, -3) opacity:0.1 radius:1];
    [self title];
    [self scroll];
    [self cancle];
    [self line];
}
- (UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.height / 4)];
        _title.text = @"分享到";
        _title.font = [UIFont systemFontOfSize:AdjustFont(26)];
        _title.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_title];
    }
    return _title;
}
- (UIScrollView *)scroll {
    if (!_scroll) {
        _scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_title.frame), SCREEN_WIDTH, self.height / 4 * 2)];
        [_scroll setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_scroll];
        
        NSArray *names = @[@"QQ",@"微信",@"微博"];
        NSArray *icons = @[@"00currency_share_icon01",@"00currency_share_icon02",@"00currency_share_icon03"];
        for (int i=0; i<names.count; i++) {
            UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
            view.frame = CGRectMake(i * SCREEN_WIDTH / 3, 0, SCREEN_WIDTH / 3, _scroll.height);
            view.tag = i;
            [view addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [_scroll addSubview:view];
            
            UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, view.width, view.height / 2)];
            image.centerY = view.height / 2 - 10;
            image.image = [UIImage imageNamed:icons[i]];
            image.contentMode = UIViewContentModeScaleAspectFit;
            [view addSubview:image];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(image.frame), view.width, 20)];
            label.text = names[i];
            label.font = [UIFont systemFontOfSize:AdjustFont(26) weight:UIFontWeightThin];
            label.textColor = kColor_Text_Black;
            label.textAlignment = NSTextAlignmentCenter;
            [view addSubview:label];
            
        }
    }
    return _scroll;
}
- (UIButton *)cancle {
    if (!_cancle) {
        _cancle = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancle setFrame:CGRectMake(0, CGRectGetMaxY(_scroll.frame), SCREEN_WIDTH, self.height / 4)];
        [_cancle setTitle:@"取消" forState:UIControlStateNormal];
        [_cancle.titleLabel setFont:[UIFont boldSystemFontOfSize:AdjustFont(26)]];
        [_cancle setTitleColor:kColor_Text_Black forState:UIControlStateNormal];
        [_cancle setTitleColor:kColor_Text_Black forState:UIControlStateHighlighted];
        [_cancle setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_cancle];
    }
    return _cancle;
}
- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] initWithFrame:CGRectMake(0, _cancle.top, SCREEN_WIDTH, 1)];
        _line.backgroundColor = kColor_BG;
        [self addSubview:_line];
    }
    return _line;
}

- (void)btnClick:(UIButton *)btn {
    // QQ
    if (btn.tag == 0) {
        [OpenShare shareToQQFriends:_message Success:^(OSMessage *message) {
            
        } Fail:^(OSMessage *message, NSError *error) {
            
        }];
    }
    // 微信
    else if (btn.tag == 1) {
        [OpenShare shareToWeixinSession:_message Success:^(OSMessage *message) {
            NSLog(@"分享成功");
        } Fail:^(OSMessage *message, NSError *error) {
            NSLog(@"分享失败");
        }];
    }
    // 微博
    else if (btn.tag == 2) {
        [OpenShare shareToWeibo:_message Success:^(OSMessage *message) {
            NSLog(@"分享成功");
        } Fail:^(OSMessage *message, NSError *error) {
            NSLog(@"分享失败");
        }];
    }
}

@end
