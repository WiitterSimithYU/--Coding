//
//  UILabel+Commonly.h
//  coding-ios-master
//
//  Created by MAC on 2018/4/23.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Commonly)

/// 标题
- (void)titleFontAndColor;
/// 描述
- (void)descFontAndColor;
/// 小字
- (void)eyeFontAndColor;
///
- (void)changeFont:(UIFont *)font color:(UIColor *)color;

@end
