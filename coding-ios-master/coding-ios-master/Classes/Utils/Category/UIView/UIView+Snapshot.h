//
//  UIView+Snapshot.h
//  iOS
//
//  Created by 郑业强 on 2018/4/6.
//  Copyright © 2018年 郑业强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Snapshot)

- (UIImage *)snapshotSingleView;
- (UIImage *)snapshotSingleView:(CGRect)frame;

@end
