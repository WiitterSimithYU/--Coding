//
//  POPAnimation+Extension.m
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import "POPAnimation+Extension.h"

@implementation POPAnimation (Extension)

+ (POPSpringAnimation *)createSpringAnimation:(NSNumber *)to {
    return [self createSpringAnimation:nil to:to time:0];
}

+ (POPSpringAnimation *)createSpringAnimation:(NSNumber *)from to:(NSNumber *)to {
    return[self createSpringAnimation:from to:to time:0];
}

+ (POPSpringAnimation *)createSpringAnimation:(NSNumber *)from to:(NSNumber *)to time:(NSTimeInterval)time {
    POPSpringAnimation *spring = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    if (from) {
        spring.fromValue = from;
    }
    if (to) {
        spring.toValue = to;
    }
    if (!time) {
        time = 0;
    }
    spring.beginTime = CACurrentMediaTime() + time;
    spring.springBounciness = 10.0f;
    return spring;
}


@end
