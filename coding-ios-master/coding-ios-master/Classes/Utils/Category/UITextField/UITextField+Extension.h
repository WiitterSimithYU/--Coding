//
//  UITextField+Extension.h
//  iOS
//
//  Created by 郑业强 on 2018/4/3.
//  Copyright © 2018年 郑业强. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - Enum
typedef NS_ENUM(NSInteger, UITextFieldType) {
    UITextFieldTypeLeft,
    UITextFieldTypeRight,
};

#pragma mark - 声明
@interface UITextField (Extension)

- (void)setImageWithType:(UITextFieldType)type image:(NSString *)image ;

@end
