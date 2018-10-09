//
//  GCDUtils.m
//  iOS
//
//  Created by 郑业强 on 2018/4/4.
//  Copyright © 2018年 郑业强. All rights reserved.
//

#import "GCDUtils.h"

@implementation GCDUtils
SingleImplementation(GCDUtils)

- (void)doThingWithMainThead:(dispatch_block_t)block {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (block) {
            block();
        }
    });
}
- (void)doThingWithOtherThead:(dispatch_block_t)block {
    dispatch_async(self.queue, ^{
        if (block) {
            block();
        }
    });
}
- (dispatch_queue_t)queue {
    if (!_queue) {
        _queue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
    }
    return _queue;
}


- (void)doDelegate:(id)delegate selector:(SEL)sel {
    if (delegate && [delegate respondsToSelector:sel]) {
        [delegate performSelector:sel];
    }
}
- (void)doDelegate:(id)delegate selector:(SEL)sel object:(id)object {
    if (delegate && [delegate respondsToSelector:sel]) {
        [delegate performSelector:sel withObject:object];
    }
}
- (void)doDelegate:(id)delegate selector:(SEL)sel object:(id)object object:(id)object2 {
    if (delegate && [delegate respondsToSelector:sel]) {
        [delegate performSelector:sel withObject:object withObject:object2];
    }
}

@end
