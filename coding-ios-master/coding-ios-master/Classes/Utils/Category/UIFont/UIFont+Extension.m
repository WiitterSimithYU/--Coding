//
//  UIFont+Extension.m
//  KKPhoto
//
//  Created by 郑业强 on 2017/7/30.
//  Copyright © 2017年 郑业强. All rights reserved.
//

#import "UIFont+Extension.h"

#define IS_IPHONE_5 (ScreenHeight == 568.0f)
#define IS_IPHONE_6 (ScreenHeight == 667.0f)
#define IS_IPHONE_6_PLUS (ScreenHeight == 736.0f)
#define IS_IPHONE_6_PLUS_UP (ScreenHeight > 736.0f)
#define iPhoneX     (ScreenWidth == 375.f && ScreenHeight == 812.f ? YES : NO)

#define IPHONE6_INCREMENT 2
#define IPHONE6PLUS_INCREMENT 3
#define IPHONE6PLUS_UP_INCREMENT 4

@implementation UIFont (Extension)

+ (CGFloat)adjustFontSize:(CGFloat)fontsize {
    CGFloat newFont;
    if (IS_IPHONE_5) {
        newFont = fontsize;
    } else if (IS_IPHONE_6) {
        newFont = fontsize + IPHONE6_INCREMENT;
    } else if (IS_IPHONE_6_PLUS) {
        newFont = fontsize + IPHONE6PLUS_INCREMENT;
    } else if (IS_IPHONE_6_PLUS_UP) {
        newFont = fontsize + IPHONE6PLUS_UP_INCREMENT;
    } else {
        newFont = fontsize;
    }
    return newFont;
}



@end

