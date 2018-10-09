//
//  DataUtil.m
//  iOS
//
//  Created by 郑业强 on 2018/4/5.
//  Copyright © 2018年 郑业强. All rights reserved.
//

#import "DataUtil.h"

@implementation DataUtil

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableLeaves
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

@end
