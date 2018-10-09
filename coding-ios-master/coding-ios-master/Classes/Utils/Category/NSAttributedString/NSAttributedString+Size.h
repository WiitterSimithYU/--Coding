//
//  NSAttributedString+Size.h
//  ZhongLv
//
//  Created by MAC on 2018/4/11.
//  Copyright © 2018年 Zhonglv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (Size)

/// 计算富文本尺寸
- (CGSize)sizeWithMaxSize:(CGSize)maxSize;
/// 设置富文本, 行距, 颜色, 字体, 文本
+ (NSAttributedString *)attributedWithLineSpacing:(NSInteger)lineSpacing
                                            color:(UIColor *)color
                                             font:(UIFont *)font
                                              str:(NSString *)str;

@end
