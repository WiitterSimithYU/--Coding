//
//  HomeCell.m
//  coding-ios-master
//
//  Created by MAC on 2018/6/7.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeCell.h"

typedef void (^HomeCellBlock)(void);

#pragma mark - 声明
@interface HomeCell ()

@property (nonatomic, strong) HomeShapeView *shape;
@property (nonatomic, strong) CADisplayLink *timer;
@property (nonatomic, copy  ) HomeCellBlock block;
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *desc;

@end

#pragma mark - 实现
@implementation HomeCell

#pragma mark - 初始化
- (void)initUI {
    [self icon];
    [self desc];
    [self shape];
}
- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width / 3, self.width / 3)];
        _icon.center = CGPointMake(self.width / 2, self.height / 2);
        [self addSubview:_icon];
    }
    return _icon;
}
- (UILabel *)desc {
    if (!_desc) {
        _desc = [[UILabel alloc] initWithFrame:CGRectMake(0, self.height - 20, self.width, 20)];
        _desc.text = @"隐隐春雷";
        _desc.font = [UIFont systemFontOfSize:adjustFont(12)];
        _desc.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_desc];
    }
    return _desc;
}
- (void)timer:(HomeCellBlock)block {
    if (!_timer) {
        _block = block;
        _timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(callback)];
        [_timer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
}
- (HomeShapeView *)shape {
    if (!_shape) {
        _shape = [HomeShapeView loadCode:self.bounds];
        [self addSubview:_shape];
    }
    return _shape;
}

#pragma mark - 设置
// 设置下载进度
- (void)setProgress:(CGFloat)progress {
    _progress = progress >= 1 ? 1 : progress;
    _shape.progress = _progress;
    _icon.alpha = _progress;
}
// 设置状态
- (void)setStatus:(HomeShapeStatus)status {
    _status = status;
    _shape.status = status;
    if (status == HomeShapeStatusNotDownload) {
        _desc.textColor = ColorTextMedium;
        _shape.hidden = YES;
        [self timerInvalidate];
    }
    else if (status == HomeShapeStatusDownloading) {
        _desc.textColor = ColorTextMedium;
        _shape.hidden = NO;
        [self timer:^{
            [self setProgress:_progress + 0.005];
        }];
    }
    else if (status == HomeShapeStatusDownloaded) {
        _desc.textColor = ColorTextBold;
        _shape.hidden = NO;
        _icon.image = [UIImage imageNamed:_data];
        [self timerInvalidate];
    }
}
// 线条颜色
- (void)setShapeColor:(UIColor *)shapeColor {
    _shapeColor = shapeColor;
    _shape.shapeColor = shapeColor;
}
// 数据
- (void)setData:(NSString *)data {
    _data = data;
    _icon.image = [UIImage imageNamed:[NSString stringWithFormat:@"灰_%@",data]];
    _desc.text = data;
}

#pragma mark - 操作
// 回调
- (void)callback {
    if (_block) {
        _block();
    }
}
// 定时器停止
- (void)timerInvalidate {
    [self.timer invalidate];
    [self setTimer:nil];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.progress = 0;
    self.status = HomeShapeStatusDownloading;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.status = HomeShapeStatusDownloaded;
    });
}

@end


