//
//  MJRefreshNormalHeader+Extension.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "MJRefreshNormalHeader+Extension.h"

@implementation MJRefreshNormalHeader (Extension)

+ (MJRefreshNormalHeader *)headerWithNormalRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock {
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:refreshingBlock];
    header.stateLabel.hidden = YES;
    header.lastUpdatedTimeLabel.hidden = YES;
    header.arrowView.center = header.center;
    return header;
}
+ (MJRefreshNormalHeader *)headerWithNormalRefreshingSEL:(id)target refreshingAction:(SEL)action {
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:action];
    header.stateLabel.hidden = YES;
    header.lastUpdatedTimeLabel.hidden = YES;
    header.arrowView.center = header.center;
    return header;
}

@end
