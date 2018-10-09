//
//  NSString+Extension.m
//  iOS
//
//  Created by RY on 2018/3/20.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (CGSize)sizeWithMaxSize:(CGSize)maxSize font:(UIFont *)font {
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil].size;
}
- (CGSize)sizeWithMaxSize:(CGSize)maxSize font:(UIFont *)font lineHeight:(CGFloat)lineHeight {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineHeight];
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font, NSParagraphStyleAttributeName: paragraphStyle} context:nil].size;
}


@end
