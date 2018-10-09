//
//  UIImageView+SDWebManager.m
//  coding-ios-master
//
//  Created by MAC on 2018/4/24.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "UIImageView+SDWebManager.h"


@implementation UIImageView (SDWebManager)

// 渐变动画
- (void)setWithImageURL:(NSString *)imageURL
                options:(SDWebImageDownloaderOptions)options
               progress:(SDWebImageDownloaderProgressBlock)progress
             completion:(void (^)(UIImage *image))completion {
    NSURL *url = [NSURL URLWithString:imageURL];
    __weak UIImageView *weak = self;
    SDWebImageDownloader *loader = [SDWebImageDownloader sharedDownloader];
    [loader downloadImageWithURL:url options:options progress:progress completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
        [UIView transitionWithView:weak duration:0.2 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            [weak setImage:image];
        } completion:^(BOOL finished) {
            if (completion) {
                completion(image);
            }
        }];
    }];
    
    
    
//    SDWebImageDownloader *manager = [SDWebImageManager sharedManager];
//    NSURL *url = [NSURL URLWithString:imageURL];
//    __weak UIImageView *weak = self;
//
//    [manager downlo]
//    [manager downloadImageWithURL:url options:options progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
//        [UIView transitionWithView:weak duration:0.2 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
//            [weak setImage:image];
//        } completion:^(BOOL finished) {
//            if (completion) {
//                completion(image);
//            }
//        }];
//    }];
}

@end
