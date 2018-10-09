//
//  Music.h
//  coding-ios-master
//
//  Created by MAC on 2018/5/15.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - 代理
@class Music;
@protocol MusicDelegate<NSObject>

@optional
/// 播放器播放完成
- (void)music:(Music *)music didEndPlay:(NSString *)url;
/// 播放器正在播放
- (void)music:(Music *)music playWithSecond:(NSTimeInterval)second;

@end

#pragma mark - 声明
@interface Music : NSObject
SingleInterface(Music)

/// 代理
@property (nonatomic, weak  ) id<MusicDelegate> delegate;

/// 播放
- (void)play;
/// 播放网络音频
- (void)playWithUrl:(NSString *)url;
/// 播放网络音频
- (void)playWithUrls:(NSArray *)urls;
/// 暂停
- (void)pause;
/// 设置速率
- (void)setRate:(CGFloat)rate;

@end
