//
//  UITextField+Extension.m
//  iOS
//
//  Created by 郑业强 on 2018/4/3.
//  Copyright © 2018年 郑业强. All rights reserved.
//

#import "UITextField+Extension.h"

@implementation UITextField (Extension)

- (void)setImageWithType:(UITextFieldType)type image:(NSString *)image {
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:({
        CGRect frame;
        if (image && image.length != 0) {
            frame = CGRectMake(0, 0, self.height, self.height - 15);
        } else {
            frame = CGRectMake(0, 0, 15, 0);
        }
        frame;
    })];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    if (image && image.length != 0) {
        imageview.image = [UIImage imageNamed:image];
    }
    if (type == UITextFieldTypeLeft) {
        self.leftView = imageview;
        self.leftViewMode = UITextFieldViewModeAlways;
    } else {
        self.rightView = imageview;
        self.rightViewMode = UITextFieldViewModeAlways;
    }
}

@end
