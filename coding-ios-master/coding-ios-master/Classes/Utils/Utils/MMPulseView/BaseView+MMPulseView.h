//
//  BaseView+MMPulseView.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/10.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView.h"
#import "MMPulseView.h"

@interface BaseView (MMPulseView)

- (MMPulseView *)createHalo:(CGFloat)minRadius maxRadius:(CGFloat)maxRadius frame:(CGRect)frame;

@end
