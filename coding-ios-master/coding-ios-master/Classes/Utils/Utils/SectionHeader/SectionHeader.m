//
//  SectionHeader.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/18.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "SectionHeader.h"

#pragma mark - 声明
@interface SectionHeader()

@property (nonatomic, strong) TTTAttributedLabel *first;

@end

#pragma mark - 实现
@implementation SectionHeader

+ (instancetype)initWithCollection:(UICollectionView *)collection kind:(NSString *)kind index:(NSIndexPath *)index {
    SectionHeader *view = [SectionHeader loadCode:collection kind:kind index:index];
    [view setBackgroundColor:WhiteColor];
    [view first];
    return view;
}
- (TTTAttributedLabel *)first {
    if (!_first) {
        _first = [[TTTAttributedLabel alloc] initWithFrame:({
            CGRectMake(0, 0, ScreenWidth, self.height);
        })];
        _first.textAlignment = NSTextAlignmentCenter;
        _first.backgroundColor = WhiteColor;
        [self addSubview:_first];
        
        NSString *text = @"「The Lastest」";
        [_first setText:text afterInheritingLabelAttributesAndConfiguringWithBlock:^ NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
            NSRange boldRange1 = [[mutableAttributedString string] rangeOfString:@"「The" options:NSCaseInsensitiveSearch];
            NSRange boldRange2 = [[mutableAttributedString string] rangeOfString:@"」" options:NSCaseInsensitiveSearch];
            NSRange strikeRange = [[mutableAttributedString string] rangeOfString:@"Lastest" options:NSCaseInsensitiveSearch];
            UIFont *font = [UIFont systemFontOfSize:adjustFont(14)];
            CTFontRef cgFont = CTFontCreateWithName((__bridge CFStringRef)font.fontName, font.pointSize, NULL);
            [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)cgFont range:boldRange1];
            [mutableAttributedString addAttribute:(NSString *)kCTForegroundColorAttributeName value:ColorTextHeavy range:boldRange1];
            
            [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)cgFont range:boldRange2];
            [mutableAttributedString addAttribute:(NSString *)kCTForegroundColorAttributeName value:ColorTextHeavy range:boldRange2];
            
            [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)cgFont range:strikeRange];
            [mutableAttributedString addAttribute:(NSString *)kCTForegroundColorAttributeName value:ThinColor range:strikeRange];
            CFRelease(cgFont);
            return mutableAttributedString;
        }];
    }
    return _first;
}

@end
