//
//  HomePushButton.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/9.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "HomePushButton.h"
#import "DisplayLinkUtil.h"
#import "BaseView+MMPulseView.h"

#pragma mark - 声明
@interface HomePushButton() {
    // 当前选择
    NSInteger _currentChoose;
    CGFloat aaaa;
}

// 是否在动画中
@property (nonatomic, assign, getter=isShow) BOOL show;
@property (nonatomic, strong) UIButton *speed;
@property (nonatomic, strong) UIButton *control;

@end

#pragma mark - 实现
@implementation HomePushButton

#pragma mark - 初始化
- (void)initUI {
    [self setUserInteractionEnabled:YES];
    [self setClipsToBounds:NO];
    [self.layer setMasksToBounds:NO];
    [self chooseTapClick];
    [self createLongGesture:self action:@selector(chooseLongClick:)];
    
//    aaaa = self.width;
//    [DisplayLinkUtil initWithBlock:^{
//        aaaa += 1;
//        _halo.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, aaaa, aaaa) cornerRadius:aaaa / 2].CGPath;
//    }];
}
- (UIButton *)speed {
    if (!_speed) {
        _speed = [UIButton buttonWithType:UIButtonTypeCustom];
        _speed.frame = CGRectMake(0, 0, 30, 30);
        _speed.layer.cornerRadius = 30 / 2;
        _speed.layer.masksToBounds = YES;
        _speed.alpha = 0;
        [_speed setImage:[UIImage imageNamed:@"menu_message_icon_more"] forState:UIControlStateNormal];
        __weak typeof(self) weak = self;
        [_speed addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            [weak enlarge:weak.speed complete:^(POPAnimation *anim, BOOL finished) {
                [weak hide];
            }];
            if (weak.delegate && [weak.delegate respondsToSelector:@selector(pushButton:didTapSpeed:)]) {
                [weak.delegate pushButton:weak didTapSpeed:weak.speed];
            }
        }];
        [self addSubview:_speed];
    }
    return _speed;
}
- (UIButton *)control {
    if (!_control) {
        _control = [UIButton buttonWithType:UIButtonTypeCustom];
        _control.frame = CGRectMake(0, 0, 30, 30);
        _control.layer.cornerRadius = 30 / 2;
        _control.layer.masksToBounds = YES;
        _control.alpha = 0;
        [_control setImage:[UIImage imageNamed:@"cosleep_message_icon_more"] forState:UIControlStateNormal];
        __weak typeof(self) weak = self;
        [_control addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            [weak enlarge:weak.control complete:^(POPAnimation *anim, BOOL finished) {
                [weak hide];
            }];
            if (weak.delegate && [weak.delegate respondsToSelector:@selector(pushButton:didTapControl:)]) {
                [weak.delegate pushButton:weak didTapControl:weak.control];
            }
        }];
        [self addSubview:_control];
    }
    return _control;
}
- (void)createLongGesture:(id)target action:(SEL)selection {
    UILongPressGestureRecognizer *longG = [[UILongPressGestureRecognizer alloc] initWithTarget:target action:selection];
    [self addGestureRecognizer:longG];
}

#pragma mark - 手势
// 点击
- (void)chooseTapClick {
    __weak typeof(self) weak = self;
    [self addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        // 代理回调
        if (weak.delegate && [weak.delegate respondsToSelector:@selector(pushButtonDidTap:)]) {
            [weak.delegate pushButtonDidTap:weak];
        }
        // 光晕
        [weak createHalo:weak.width / 2 maxRadius:weak.width frame:CGRectMake(-30, -30, weak.width + 60, weak.height + 60)];
    }];
}
// 长按
- (void)chooseLongClick:(UIGestureRecognizer *)gestrue {
    // 开始长摁
    if (gestrue.state == UIGestureRecognizerStateBegan) {
        _currentChoose = 0;
        [self show];
    }
    // 移动中
    else if (gestrue.state == UIGestureRecognizerStateChanged) {
        CGPoint point = [gestrue locationInView:self];
        if (CGRectContainsPoint(_speed.frame, point)) {
            [self enlarge:_speed complete:nil];
            [self narrow:_control complete:nil];
            _currentChoose = 1;
        }
        else if (CGRectContainsPoint(_control.frame, point)) {
            [self enlarge:_control complete:nil];
            [self narrow:_speed complete:nil];
            _currentChoose = 2;
        }
        else {
            [self narrow:_speed complete:nil];
            [self narrow:_control complete:nil];
            _currentChoose = 0;
        }
    }
    // 结束
    else if (gestrue.state == UIGestureRecognizerStateEnded) {
        if (_currentChoose != 1) {
            [self narrow:_speed complete:nil];
        }
        else if (_currentChoose != 2) {
            [self narrow:_control complete:nil];
        }
        if (_currentChoose == 1) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(pushButton:didTapSpeed:)]) {
                [self.delegate pushButton:self didTapSpeed:_speed];
            }
        }
        if (_currentChoose == 2) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(pushButton:didTapControl:)]) {
                [self.delegate pushButton:self didTapControl:_control];
            }
        }
        NSTimeInterval time = _currentChoose == 0 ? 2.f : 0;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self hide];
        });
    }
}

#pragma mark - 事件响应
// 更改响应范围
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    for (UIView *view in self.subviews) {
        BOOL isTouch = CGRectContainsPoint(view.frame, point);
        if (isTouch == YES) {
            return view;
        }
    }
    return [super hitTest:point withEvent:event];
}

#pragma mark - 动画
- (void)show {
    if (_show == YES) {
        return;
    }
    _show = YES;
    
    
    [self.speed addAnimationWithStyle:HomePushButtonStyleAlpha animation:HomePushButtonAnimationShow];
    [self.control addAnimationWithStyle:HomePushButtonStyleAlpha animation:HomePushButtonAnimationShow];
    
    [self.speed addAnimationWithStyle:HomePushButtonStyleScale animation:HomePushButtonAnimationShow];
    [self.control addAnimationWithStyle:HomePushButtonStyleScale animation:HomePushButtonAnimationShow];
    
    [self.speed addAnimationWithStyle:HomePushButtonStyleMove animation:HomePushButtonAnimationShow position:_type button:HomePushBtnOne];
    [self.control addAnimationWithStyle:HomePushButtonStyleMove animation:HomePushButtonAnimationShow position:_type button:HomePushBtnTwo];
    
    
}
- (void)hide {
    if (_show == NO) {
        return;
    }
    _show = NO;
    
    __weak typeof(self) weak = self;
    [self.control addAnimationWithStyle:HomePushButtonStyleScale animation:HomePushButtonAnimationHide toValue:_currentChoose == 2 ? CGPointMake(1.3, 1.3) : CGPointMake(1.0, 1.0)];
    [self.speed addAnimationWithStyle:HomePushButtonStyleScale animation:HomePushButtonAnimationHide toValue:_currentChoose == 1 ? CGPointMake(1.3, 1.3) : CGPointMake(1.0, 1.0) complete:^(POPAnimation *anim, BOOL finished) {
        [weak.speed addAnimationWithStyle:HomePushButtonStyleMove animation:HomePushButtonAnimationHide position:weak.type button:HomePushBtnOne];
        [weak.control addAnimationWithStyle:HomePushButtonStyleMove animation:HomePushButtonAnimationHide position:weak.type button:HomePushBtnTwo];
        
        [weak.speed addAnimationWithStyle:HomePushButtonStyleAlpha animation:HomePushButtonAnimationHide];
        [weak.control addAnimationWithStyle:HomePushButtonStyleAlpha animation:HomePushButtonAnimationHide];
        
        [weak.speed addAnimationWithStyle:HomePushButtonStyleScale animation:HomePushButtonAnimationHide toValue:CGPointMake(0.1, 0.1)];
        [weak.control addAnimationWithStyle:HomePushButtonStyleScale animation:HomePushButtonAnimationHide toValue:CGPointMake(0.1, 0.1)];
    }];
}

// 放大
- (void)enlarge:(UIButton *)button complete:(HomeAnimationBlock)complete {
    [button createScale:CGPointMake(1.2, 1.2) name:kCAMediaTimingFunctionEaseOut duration:0.1 complete:complete];
}
// 缩小
- (void)narrow:(UIButton *)button complete:(HomeAnimationBlock)complete {
    [button createScale:CGPointMake(1, 1) name:kCAMediaTimingFunctionEaseOut duration:0.1 complete:complete];
}


@end






