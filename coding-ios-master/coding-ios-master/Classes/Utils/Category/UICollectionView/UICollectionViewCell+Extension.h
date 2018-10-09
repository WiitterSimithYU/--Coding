//
//  UICollectionViewCell+Extension.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/17.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewCell (Extension)

/// 从代码创建cell
+ (instancetype)loadCode:(UICollectionView *)collection index:(NSIndexPath *)index;
/// 初始化UI
- (void)initUI;

@end
