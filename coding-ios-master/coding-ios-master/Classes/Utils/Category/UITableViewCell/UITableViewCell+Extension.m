//
//  UITableViewCell+Extension.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/17.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "UITableViewCell+Extension.h"

@implementation UITableViewCell (Extension)

// 加载第一个nib
+ (instancetype)loadFirstNib:(UITableView *)table {
    UITableViewCell *cell = [self loadNib:0 frame:table];
    return cell;
}

// 加载最后一个nib
+ (instancetype)loadLastNib:(UITableView *)table {
    NSInteger index = [self getCells].count - 1;
    UITableViewCell *cell = [self loadNib:index frame:table];
    return cell;
}

// 从代码创建cell
+ (instancetype)loadCode:(UITableView *)table {
    NSString *name = NSStringFromClass(self);
    UITableViewCell *cell = [table dequeueReusableCellWithIdentifier:name];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:name];
    }
    return cell;
}

// 加载指定nib
+ (instancetype)loadNib:(NSInteger)index frame:(UITableView *)table {
    NSString *name = NSStringFromClass(self);
    UITableViewCell *cell = [table dequeueReusableCellWithIdentifier:name];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil][index];
    }
    return cell;
}

// 获取XIB中cell个数
+ (NSArray *)getCells {
    NSString *name = NSStringFromClass(self);
    return [[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil];
}

@end
