//
//  SectionHeader.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionHeader : UICollectionReusableView

+ (instancetype)initWithCollection:(UICollectionView *)collection kind:(NSString *)kind index:(NSIndexPath *)index;

@end
