//
//  UICollectionViewCell+Extension.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/17.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "UICollectionViewCell+Extension.h"

@implementation UICollectionViewCell (Extension)

/// 从代码创建cell
+ (instancetype)loadCode:(UICollectionView *)collection index:(NSIndexPath *)index {
    NSString *identifier = NSStringFromClass([self class]);
    UICollectionViewCell *cell = [collection dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:index];
    [cell initUI];
    return cell;
}
- (void)initUI {
    
}

@end
