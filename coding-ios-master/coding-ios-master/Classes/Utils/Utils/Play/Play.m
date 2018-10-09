//
//  Play.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/6/14.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "Play.h"

#pragma mark - 声明
@interface Play() {
//    AVAudioPlayer *player;
}

@end

#pragma mark - 实现
@implementation Play

+ (void)play {
    [[Play new] loadMusic];
}

- (void)loadMusic {
    
//    dispatch_queue_t queue1 = dispatch_queue_create("queue1", DISPATCH_QUEUE_CONCURRENT);
//
//    dispatch_async(queue1, ^{
    
        NSBundle *bundle = [NSBundle mainBundle];
        
        // 音频文件路径
        NSString *urlString = [bundle pathForResource:@"bgm005-WxfmFiYAlq5rtYJgDVZY" ofType:@"mp3"];
        
        // 初始化本地的url
        NSURL *url = [[NSURL alloc] initFileURLWithPath:urlString];
        
        // 初始化音频对象，player要求是一个全局对象
        AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        
        
        // 分配播放所需的资源，并将其加入内部播放队列
        [player prepareToPlay];
        if ([player play]) {
            NSLog(@"正在播放");
        }
//    });
}


@end
