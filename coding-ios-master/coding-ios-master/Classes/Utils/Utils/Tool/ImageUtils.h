//
//  ImageUtils.h
//  KKTest
//
//  Created by RY on 17/6/25.
//  Copyright © 2017年 OuDa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageUtils : NSObject

//=================================== 颜色转图像 ===================================//
/// 颜色转图片 1px*1px
+ (UIImage *)imageWithColor:(UIColor *)color;

/// 颜色转图片指定尺寸
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;


//==================================== 二维码 ====================================//
/// 生成一张普通的二维码
+ (UIImage *)createNormalQrWithData:(NSString *)data imageWidth:(CGFloat)imageWidth;

/// 生成一张带有logo的二维码
+ (UIImage *)createLogoQrWithData:(NSString *)data logoImage:(NSString *)logoImage logoScale:(CGFloat)logoScale;

/// 生成一张彩色的二维码
+ (UIImage *)createColorQrWithData:(NSString *)data bgColor:(CIColor *)bgColor mainColor:(CIColor *)mainColor;

@end
