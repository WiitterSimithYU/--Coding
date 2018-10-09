//
//  MJRefreshBackFooter+Extension.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <MJRefresh/MJRefresh.h>

@interface MJRefreshBackNormalFooter (Extension)

+ (MJRefreshBackNormalFooter *)footerWithNormalRefreshing:(MJRefreshComponentRefreshingBlock)refreshingBlock;
+ (MJRefreshBackNormalFooter *)footerWithNormalRefreshingSEL:(id)target refreshingAction:(SEL)action;

@end
