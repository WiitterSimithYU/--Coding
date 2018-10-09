//
//  ShareViewSubContent.m
//  ZhongLv
//
//  Created by MAC on 2018/5/11.
//  Copyright © 2018年 Zhonglv. All rights reserved.
//

#import "ShareViewSubContent.h"

@implementation ShareViewSubContent

+ (instancetype)initWithFrame:(CGRect)frame {
    ShareViewSubContent *view = [[NSBundle mainBundle] loadNibNamed:@"ShareViewSubContent" owner:nil options:nil].firstObject;
    view.frame = frame;
    return view;
}

@end
