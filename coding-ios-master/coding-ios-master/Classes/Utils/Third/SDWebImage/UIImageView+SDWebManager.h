//
//  UIImageView+SDWebManager.h
//  coding-ios-master
//
//  Created by MAC on 2018/4/24.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (SDWebManager)

- (void)setWithImageURL:(NSString *)imageURL
                options:(SDWebImageDownloaderOptions)options
               progress:(SDWebImageDownloaderProgressBlock)progress
             completion:(void (^)(UIImage *image))completion;

@end
