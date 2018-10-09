//
//  UICollectionReusableView+Extension.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/17.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "UICollectionReusableView+Extension.h"

@implementation UICollectionReusableView (Extension)

/// 从代码创建cell
+ (instancetype)loadCode:(UICollectionView *)collection kind:(NSString *)kind index:(NSIndexPath *)index {
    NSString *identifier = NSStringFromClass([self class]);
    UICollectionReusableView *view = [collection dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:identifier forIndexPath:index];
    return view;
}


@end
