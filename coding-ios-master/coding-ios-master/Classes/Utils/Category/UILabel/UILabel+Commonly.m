//
//  UILabel+Commonly.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/23.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "UILabel+Commonly.h"

@implementation UILabel (Commonly)

// 标题
- (void)titleFontAndColor {
    [self changeFont:[UIFont systemFontOfSize:adjustFont(12)] color:ColorTextHeavy];
}
// 描述
- (void)descFontAndColor {
    [self changeFont:[UIFont systemFontOfSize:adjustFont(14)] color:ColorTextLight];
}
// 小字
- (void)eyeFontAndColor {
    [self changeFont:[UIFont systemFontOfSize:adjustFont(10)] color:ColorTextThin];
}

- (void)changeFont:(UIFont *)font color:(UIColor *)color {
    self.font = font;
    self.textColor = color;
}


@end
