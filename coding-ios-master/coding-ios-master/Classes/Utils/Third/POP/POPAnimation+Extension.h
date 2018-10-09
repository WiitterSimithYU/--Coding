//
//  POPAnimation+Extension.h
//  coding-ios-master
//
//  Created by 郑业强 on 2018/4/19.
//  Copyright © 2018年 kk. All rights reserved.
//

#import <pop/pop.h>

@interface POPAnimation (Extension)

+ (POPSpringAnimation *)createSpringAnimation:(NSNumber *)to;
+ (POPSpringAnimation *)createSpringAnimation:(NSNumber *)from to:(NSNumber *)to;
+ (POPSpringAnimation *)createSpringAnimation:(NSNumber *)from to:(NSNumber *)to time:(NSTimeInterval)time;

@end
