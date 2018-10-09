//
//  GCDUtils.h
//  iOS
//
//  Created by 郑业强 on 2018/4/4.
//  Copyright © 2018年 郑业强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCDUtils : NSObject
SingleInterface(GCDUtils)

@property (nonatomic, strong) dispatch_queue_t queue;

// 主线程调用
- (void)doThingWithMainThead:(dispatch_block_t)block;
- (void)doThingWithOtherThead:(dispatch_block_t)block;

// 代理是否可执行
- (void)doDelegate:(id)delegate selector:(SEL)sel;
- (void)doDelegate:(id)delegate selector:(SEL)sel object:(id)object;
- (void)doDelegate:(id)delegate selector:(SEL)sel object:(id)object object:(id)object2;

@end
