//
//  NSAttributedString+Size.m
//  ZhongLv
//
//  Created by MAC on 2018/4/11.
//  Copyright © 2018年 Zhonglv. All rights reserved.
//

#import "NSAttributedString+Size.h"

@implementation NSAttributedString (Size)

- (CGSize)sizeWithMaxSize:(CGSize)maxSize {
    CGSize attSize = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
    return attSize;
}

+ (NSAttributedString *)attributedWithLineSpacing:(NSInteger)lineSpacing
                            color:(UIColor *)color
                             font:(UIFont *)font
                              str:(NSString *)str {
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineSpacing = lineSpacing;
    paragraphStyle.alignment = NSTextAlignmentLeft;
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    [attributes setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
    [attributes setObject:font forKey:NSFontAttributeName];
    [attributes setObject:color forKey:NSForegroundColorAttributeName];
    return [[NSAttributedString alloc] initWithString:str attributes:attributes];
}


@end
