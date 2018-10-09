//
//  HomeDraw.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/8.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomeDraw.h"
#import "BaseView+HomeHeader.h"
#import "DisplayLinkUtil.h"
#import "BaseView+MMPulseView.h"
#import "HomeHeaderSlider.h"

#pragma mark - 声明
@interface HomeDraw()<UIGestureRecognizerDelegate, HomePushButtonDelegate>

// 背景三角形
@property (nonatomic, strong) CAShapeLayer *bgTriangle;
// 移动三角形
@property (nonatomic, strong) CAShapeLayer *moveTriangle;
// 内置三角形
@property (nonatomic, strong) CAShapeLayer *triangle;
// 按钮
@property (nonatomic, strong) NSMutableArray<UIImageView *> *chooses;
// 弹出视图
@property (nonatomic, strong) NSMutableArray<HomePushButton *> *pushs;
// 定时器
@property (nonatomic, strong) DisplayLinkUtil *link;

@end

#pragma mark - 实现
@implementation HomeDraw

#pragma mark - 初始化
- (void)initUI {
    [self bgTriangle];
    [self moveTriangle];
    [self triangle];
    [self chooses];
    [self pushs];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sliderValueChange:) name:@"HomeDrawNSNotification" object:nil];
    
//    [DisplayLinkUtil initWithBlock:^{
//        aaa += 0.005;
//        if (aaa >= 1) {
//            aaa = 0;
//        }
//        _moveTriangle.path = [self createTriangleWithPercent1:aaa / 2 percent2:aaa / 3 percent3:aaa];
//    }];
}
- (CAShapeLayer *)bgTriangle {
    if (!_bgTriangle) {
        _bgTriangle = [CAShapeLayer layer];
        _bgTriangle.frame = [self bounds];
        _bgTriangle.path = [self createTriangleWithWidth:HomeBgTriangleW];
        _bgTriangle.fillColor = ColorTextMedium.CGColor;
        [self.layer addSublayer:_bgTriangle];
    }
    return _bgTriangle;
}
- (CAShapeLayer *)moveTriangle {
    if (!_moveTriangle) {
        _moveTriangle = [CAShapeLayer layer];
        _moveTriangle.frame = [self bounds];
        _moveTriangle.fillColor = [ColorTextBold colorWithAlphaComponent:0.5].CGColor;
        [self.layer addSublayer:_moveTriangle];
    }
    return _moveTriangle;
}
- (CAShapeLayer *)triangle {
    if (!_triangle) {
        _triangle = [CAShapeLayer layer];
        _triangle.frame = [self bounds];
        _triangle.path = [self createTriangleWithWidth:HomeTriangleW];
        _triangle.fillColor = ColorTextBold.CGColor;
        [self.layer addSublayer:_triangle];
    }
    return _triangle;
}
- (NSMutableArray<UIImageView *> *)chooses {
    if (!_chooses) {
        _chooses = [[NSMutableArray alloc] init];
        CGFloat padding = 10;
        NSArray *rects = @[NSStringFromCGRect(CGRectMake(self.centerX - 30 / 2, [self createTopWithWidth:HomeBgTriangleW] - 30 - padding, 30, 30)),
                           NSStringFromCGRect(({
                               CGFloat triangle = HomeBgTriangleW;
                               CGFloat width = 30;
                               CGFloat height = width;
                               CGFloat left = (self.width - triangle) / 2 - width - padding;
                               CGFloat top = [self createTopWithWidth:triangle] + [self createHeightWithWidth:triangle] + padding;
                               CGRectMake(left, top, width, height);
                           })),
                           NSStringFromCGRect(({
                               CGFloat triangle = HomeBgTriangleW;
                               CGFloat width = 30;
                               CGFloat height = width;
                               CGFloat left = (self.width - triangle) / 2 + triangle + padding;
                               CGFloat top = [self createTopWithWidth:triangle] + [self createHeightWithWidth:triangle] + padding;
                               CGRectMake(left, top, width, height);
                           }))];
        for (int i=0; i<rects.count; i++) {
            UIImageView *choose = [[UIImageView alloc] init];
            [choose setFrame:CGRectFromString(rects[i])];
            [choose setUserInteractionEnabled:YES];
            [choose setImage:[UIImage imageNamed:@"灰_包菜"]];
            [choose setTag:i];
            [choose.layer setCornerRadius:choose.height / 2];
            [choose.layer setMasksToBounds:YES];
            [choose setAlpha:0.5];
            [self addSubview:choose];
            [_chooses addObject:choose];
        }
    }
    return _chooses;
}
- (NSMutableArray<HomePushButton *> *)pushs {
    if (!_pushs) {
        _pushs = [[NSMutableArray alloc] init];
        for (int i=0; i<3; i++) {
            HomePushButton *button = [HomePushButton loadCode:self.chooses[i].frame];
            [button setDelegate:self];
            [button setType:i];
            [button setTag:i];
            [self addSubview:button];
            [_pushs addObject:button];
        }
    }
    return _pushs;
}

- (UILongPressGestureRecognizer *)createLongGesture:(id)target action:(SEL)selection {
    UILongPressGestureRecognizer *longG = [[UILongPressGestureRecognizer alloc] initWithTarget:target action:selection];
    return longG;
}


#pragma mark - HomePushButtonDelegate
// 点击了三个圆圈
- (void)pushButtonDidTap:(HomePushButton *)button {
    if (self.delegate && [self.delegate respondsToSelector:@selector(homeDraw:didTapButton:)]) {
        [self.delegate homeDraw:self didTapButton:button];
    }
}
// 点击速率按钮
- (void)pushButton:(HomePushButton *)button didTapSpeed:(UIButton *)speed {
    if (self.delegate && [self.delegate respondsToSelector:@selector(homeDraw:didTapSpeed:)]) {
        [self.delegate homeDraw:self didTapSpeed:speed];
    }
}
// 点击控制按钮
- (void)pushButton:(HomePushButton *)button didTapControl:(UIButton *)control {
    if (self.delegate && [self.delegate respondsToSelector:@selector(homeDraw:didTapControl:)]) {
        [self.delegate homeDraw:self didTapControl:control];
    }
}

#pragma mark - 点击
- (void)sliderValueChange:(NSNotification *)not {
    HomeHeaderSlider *slider = (HomeHeaderSlider *)not.object;
    if (slider.tag == 0) {
        _value1 = slider.slider.value;
    }
    else if (slider.tag == 1) {
        _value2 = slider.slider.value;
    }
    else if (slider.tag == 2) {
        _value3 = slider.slider.value;
    }
    _moveTriangle.path = [self createTriangleWithPercent1:_value1 percent2:_value2 percent3:_value3];
}


//- (void)chooseLongClick:(UIGestureRecognizer *)gestrue {
//    if (gestrue.state == UIGestureRecognizerStateBegan) {
//        [self.pushs[gestrue.view.tag] show];
//    }
//    else if (gestrue.state == UIGestureRecognizerStateChanged) {
//        NSLog(@"123");
//    }
//    else if (gestrue.state == UIGestureRecognizerStateEnded) {
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [self.pushs[gestrue.view.tag] hide];
//        });
//    }
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self];
    // 点击在内三角上
    if (CGPathContainsPoint(self.triangle.path, NULL, point, NO)) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(homeDraw:didClickInTriangle:)]) {
            [self.delegate homeDraw:self didClickInTriangle:_triangle];
        }
    }
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



@end




