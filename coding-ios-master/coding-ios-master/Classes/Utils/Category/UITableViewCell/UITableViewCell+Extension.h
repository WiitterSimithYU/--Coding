//
//  UITableViewCell+Extension.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/17.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Extension)

/// 加载第一个NIB
+ (instancetype)loadFirstNib:(UITableView *)table;

/// 加载最后一个nib
+ (instancetype)loadLastNib:(UITableView *)table;

/// 从代码创建cell
+ (instancetype)loadCode:(UITableView *)table;

/// 加载指定xib
+ (instancetype)loadNib:(NSInteger)index frame:(UITableView *)table;

@end
