//
//  StatusUtils.m
//  iOS
//
//  Created by 郑业强 on 2018/4/7.
//  Copyright © 2018年 郑业强. All rights reserved.
//

#import "StatusUtils.h"

@implementation StatusUtils

+ (void)setStatusBarStyle:(UIStatusBarStyle)style animated:(BOOL)animated {
    [[UIApplication sharedApplication] setStatusBarStyle:style animated:animated];
    
}

@end
