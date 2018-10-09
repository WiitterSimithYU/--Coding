//
//  SDCycleScrollView+Manager.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/23.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "SDCycleScrollView+Manager.h"

@implementation SDCycleScrollView (Manager)

+ (instancetype)initWithFrame:(CGRect)frame {
    SDCycleScrollView *scroll = [SDCycleScrollView cycleScrollViewWithFrame:frame imageNamesGroup:@[]];
    scroll.currentPageDotColor = LightColor;
    scroll.pageDotColor = ThinColor;
    scroll.backgroundColor = LightColor;
    return scroll;
}

@end
