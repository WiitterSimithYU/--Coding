//
//  NSString+Extension.h
//  iOS
//
//  Created by RY on 2018/3/20.
//  Copyright © 2018年 KK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

- (CGSize)sizeWithMaxSize:(CGSize)maxSize font:(UIFont *)font;
- (CGSize)sizeWithMaxSize:(CGSize)maxSize font:(UIFont *)font lineHeight:(CGFloat)lineHeight;

@end
