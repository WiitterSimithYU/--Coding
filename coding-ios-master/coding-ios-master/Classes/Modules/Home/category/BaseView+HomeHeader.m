//
//  BaseView+HomeHeader.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/8.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "BaseView+HomeHeader.h"

@implementation BaseView (HomeHeader)

// 创建三角形
- (CGMutablePathRef)createTriangleWithWidth:(CGFloat)width {
    // 三角边
    CGFloat triangleE = [self createWidthWithWidth:width];
    // 高度
    CGFloat triangleH = [self createHeightWithWidth:width];
    // 顶部
    CGFloat top = [self createTopWithWidth:width];
    // 线条
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, self.width / 2, top);
    CGPathAddLineToPoint(path, NULL, self.width / 2 + triangleE / 2, top + triangleH);
    CGPathAddLineToPoint(path, NULL, self.width / 2 - triangleE / 2, top + triangleH);
    return path;
}
// 创建顶部
- (CGFloat)createTopWithWidth:(CGFloat)width {
    // 三角边
    CGFloat triangleE = [self createWidthWithWidth:width];
    // 高度
    CGFloat triangleH = [self createHeightWithWidth:triangleE];
    // 内切圆半径
    CGFloat circularR = sqrt(3) / 6.f * triangleE;
    // 顶部
    CGFloat top = self.height - (triangleH - circularR) - circularR - (self.height / 2 - circularR);
    return top;
}
// 创建宽度
- (CGFloat)createWidthWithWidth:(CGFloat)width {
    return width;
}
// 创建高度
- (CGFloat)createHeightWithWidth:(CGFloat)width {
    return sqrt(pow(width, 2) - pow(width / 2, 2));
}
// 创建三角形通过值
- (CGMutablePathRef)createTriangleWithPercent1:(CGFloat)percent1 percent2:(CGFloat)percent2 percent3:(CGFloat)percent3 {
    CGFloat outTriangleT = [self createTopWithWidth:HomeBgTriangleW];
    CGFloat inTriangleT  = [self createTopWithWidth:HomeTriangleW];
    CGFloat outTriangleW = [self createWidthWithWidth:HomeBgTriangleW];
    CGFloat inTriangleW  = [self createWidthWithWidth:HomeTriangleW];
    CGFloat outTriangleL = (ScreenWidth - outTriangleW) / 2;
    CGFloat inTriangleL  = (ScreenWidth - inTriangleW) / 2;
    CGFloat outTriangleH = [self createHeightWithWidth:HomeBgTriangleW];
    CGFloat inTriangleH  = [self createHeightWithWidth:HomeTriangleW];
    CGFloat outTriangleB = outTriangleT + outTriangleH;
    CGFloat inTriangleB  = inTriangleT + inTriangleH;
    CGFloat outTriangleR = outTriangleL + outTriangleW;
    CGFloat inTriangleR  = inTriangleL + inTriangleW;
    
    CGFloat value1x = ScreenWidth / 2;
    CGFloat value1y = outTriangleT + (inTriangleT - outTriangleT) * (1 - percent1);
    CGFloat value2x = (inTriangleL - outTriangleL) * (1 - percent2) + outTriangleL;
    CGFloat value2y = inTriangleB + (outTriangleH - inTriangleH - (inTriangleT - outTriangleT)) * percent2;
    CGFloat value3x = (inTriangleL - outTriangleL) * percent3 + inTriangleR;
    CGFloat value3y = inTriangleB + (outTriangleB - inTriangleB) * percent3;
    
    
    // 线条
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, value1x, value1y);
    CGPathAddLineToPoint(path, NULL, value2x, value2y);
    CGPathAddLineToPoint(path, NULL, value3x, value3y);
    
    return path;
}




@end



