//
//  Music.m
//  coding-ios-master
//
//  Created by MAC on 2018/5/15.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "Music.h"
#import <AVFoundation/AVFoundation.h>

#pragma mark - 声明
@interface Music ()

@property (nonatomic, strong) AVPlayer *player;

@end

#pragma mark - 实现
@implementation Music
SingleImplementation(Music)

- (AVPlayer *)player {
    if (!_player) {
        _player = [[AVPlayer alloc] init];
    }
    return _player;
}

/// 播放
- (void)play {
    
}
/// 播放网络音频
- (void)playWithUrl:(NSString *)url {
    
}
/// 播放网络音频
- (void)playWithUrls:(NSArray *)urls {
    
}
/// 暂停
- (void)pause {
    
}
/// 设置速率
- (void)setRate:(CGFloat)rate {
    
}



@end
