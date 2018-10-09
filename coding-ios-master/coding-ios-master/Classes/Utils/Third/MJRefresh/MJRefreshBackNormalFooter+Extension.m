//
//  MJRefreshBackFooter+Extension.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "MJRefreshBackNormalFooter+Extension.h"

@implementation MJRefreshBackNormalFooter (Extension)

+ (MJRefreshBackNormalFooter *)footerWithNormalRefreshing:(MJRefreshComponentRefreshingBlock)refreshingBlock {
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:refreshingBlock];
    footer.stateLabel.text = @"";
    footer.stateLabel.hidden = YES;
    return footer;
}
+ (MJRefreshBackNormalFooter *)footerWithNormalRefreshingSEL:(id)target refreshingAction:(SEL)action {
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:target refreshingAction:action];
    footer.stateLabel.text = @"";
    footer.stateLabel.hidden = YES;
    return footer;
}

@end
