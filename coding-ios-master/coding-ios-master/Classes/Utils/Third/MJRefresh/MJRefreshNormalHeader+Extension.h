//
//  MJRefreshNormalHeader+Extension.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <MJRefresh/MJRefresh.h>

@interface MJRefreshNormalHeader (Extension)

+ (MJRefreshNormalHeader *)headerWithNormalRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock;
+ (MJRefreshNormalHeader *)headerWithNormalRefreshingSEL:(id)target refreshingAction:(SEL)action;

@end
