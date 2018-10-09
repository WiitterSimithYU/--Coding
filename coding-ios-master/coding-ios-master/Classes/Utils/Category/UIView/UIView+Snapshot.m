//
//  UIView+Snapshot.m
//  iOS
//
//  Created by 郑业强 on 2018/4/6.
//  Copyright © 2018年 郑业强. All rights reserved.
//

#import "UIView+Snapshot.h"

@implementation UIView (Snapshot)

- (UIImage *)snapshotSingleView {
    CGRect rect = self.frame;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)snapshotSingleView:(CGRect)frame {
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, 0.0);
    //获取图像
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}

@end
