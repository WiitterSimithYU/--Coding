//
//  HelperUtil.m
//  SQLite（购物）
//
//  Created by Yock Deng on 15/8/22.
//  Copyright (c) 2015年 蓝桥. All rights reserved.
//

#import "HelperUtil.h"

@implementation HelperUtil

#pragma mark - 常用
#pragma 正则匹配邮箱号
+ (BOOL)checkMailInput:(NSString *)mail {

    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:mail];
}
#pragma 正则匹配手机号
+ (BOOL)checkTelNumber:(NSString *)telNumber {
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,183,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[356])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:telNumber] == YES)
        || ([regextestcm evaluateWithObject:telNumber] == YES)
        || ([regextestct evaluateWithObject:telNumber] == YES)
        || ([regextestcu evaluateWithObject:telNumber] == YES)) {
        return YES;
    }
    else {
        return NO;
    }

}
#pragma 正则匹配用户身份证号15或18位
+ (BOOL)checkUserIdCard:(NSString *)idCard {
    BOOL flag;
    if (idCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    BOOL isMatch = [pred evaluateWithObject:idCard];
    return isMatch;
}
#pragma 正则匹配URL
+ (BOOL)checkURL:(NSString *)url {
    NSString *pattern = @"^[0-9A-Za-z]{1,50}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:url];
    return isMatch;
    
}
#pragma 正则匹配银行卡号是否正确
+ (BOOL)checkBankNumber:(NSString *)bankNumber {
    NSString *bankNum=@"^([0-9]{16}|[0-9]{19})$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",bankNum];
    BOOL isMatch = [pred evaluateWithObject:bankNumber];
    return isMatch;
}
#pragma 信用卡验证
+ (BOOL)isValidCreditNumber:(NSString *)value {
    if (value.length > 9) {
        NSString * lastNum = [[value substringFromIndex:(value.length-1)] copy];//取出最后一位
        NSString * forwardNum = [[value substringToIndex:(value.length -1)] copy];//前15或18位
        NSMutableArray * forwardArr = [[NSMutableArray alloc] initWithCapacity:0];
        for (int i=0; i<forwardNum.length; i++) {
            NSString * subStr = [forwardNum substringWithRange:NSMakeRange(i, 1)];
            [forwardArr addObject:subStr];
        }
        
        NSMutableArray * forwardDescArr = [[NSMutableArray alloc] initWithCapacity:0];
        for (int i =(forwardArr.count-1); i> -1; i--) {//前15位或者前18位倒序存进数组
            [forwardDescArr addObject:forwardArr[i]];
        }
        
        NSMutableArray * arrOddNum = [[NSMutableArray alloc] initWithCapacity:0];//奇数位*2的积 < 9
        NSMutableArray * arrOddNum2 = [[NSMutableArray alloc] initWithCapacity:0];//奇数位*2的积 >9
        NSMutableArray * arrEvenNum = [[NSMutableArray alloc] initWithCapacity:0];//偶数位数组
        for (int i=0; i< forwardDescArr.count; i++) {
            NSInteger num = [forwardDescArr[i] intValue];
            if (i%2) {//偶数位
                [arrEvenNum addObject:[NSNumber numberWithInt:num]];
            }else{//奇数位
                if (num * 2 < 9) {
                    [arrOddNum addObject:[NSNumber numberWithInt:num * 2]];
                }else{
                    NSInteger decadeNum = (num * 2) / 10;
                    NSInteger unitNum = (num * 2) % 10;
                    [arrOddNum2 addObject:[NSNumber numberWithInt:unitNum]];
                    [arrOddNum2 addObject:[NSNumber numberWithInt:decadeNum]];
                }
            }
        }
        __block  NSInteger sumOddNumTotal = 0;
        [arrOddNum enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL *stop) {
            sumOddNumTotal += [obj integerValue];
        }];
        __block NSInteger sumOddNum2Total = 0;
        [arrOddNum2 enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL *stop) {
            sumOddNum2Total += [obj integerValue];
        }];
        __block NSInteger sumEvenNumTotal =0 ;
        [arrEvenNum enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL *stop) {
            sumEvenNumTotal += [obj integerValue];
        }];
        NSInteger lastNumber = [lastNum integerValue];
        NSInteger luhmTotal = lastNumber + sumEvenNumTotal + sumOddNum2Total + sumOddNumTotal;
        return (luhmTotal%10 ==0)?YES:NO;
    }
    return NO;
}

#pragma mark - 不常用
#pragma 正则匹配用户密码6-18位数字和字母组合
+ (BOOL)checkPassword:(NSString *)password {
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
    
}
#pragma 正则匹配用户姓名,20位的中文或英文
+ (BOOL)checkUserName:(NSString *)userName {
    
//    NSString *pattern = @"^[A-Za-z0-9]{6,20}+$";
    NSString *pattern = @"^([\u4e00-\u9fa5]+|([a-zA-Z]+\s?)+)$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:userName];
    return isMatch;
    
}
#pragma 正则匹员工号,12位的数字
+ (BOOL)checkEmployeeNumber:(NSString *)number {
    NSString *pattern = @"^[0-9]{12}";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:number];
    return isMatch;
    
}
#pragma 正则匹配昵称
+ (BOOL) checkNickname:(NSString *)nickname {
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    BOOL isMatch = [pred evaluateWithObject:nickname];
    return isMatch;
}
#pragma 正则匹配以C开头的18位字符
+ (BOOL) checkCtooNumberTo18:(NSString *)nickNumber {
    NSString *nickNum=@"^C{1}[0-9]{18}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nickNum];
    BOOL isMatch = [pred evaluateWithObject:nickNumber];
    return isMatch;
}
#pragma 正则匹配以C开头字符
+ (BOOL) checkCtooNumber:(NSString *)nickNumber {
    NSString *nickNum=@"^C{1}[0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nickNum];
    BOOL isMatch = [pred evaluateWithObject:nickNumber];
    return isMatch;
}
#pragma 正则只能输入数字和字母
+ (BOOL) checkTeshuZifuNumber:(NSString *)CheJiaNumber {
    NSString *bankNum=@"^[A-Za-z0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",bankNum];
    BOOL isMatch = [pred evaluateWithObject:CheJiaNumber];
    return isMatch;
}
#pragma 车牌号验证
+ (BOOL) checkCarNumber:(NSString *) CarNumber {
    NSString *bankNum = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",bankNum];
    BOOL isMatch = [pred evaluateWithObject:CarNumber];
    return isMatch;
}
#pragma 正则匹配17位车架号
+ (BOOL) checkCheJiaNumber:(NSString *)CheJiaNumber {
    NSString *bankNum=@"^(\\d{17})$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",bankNum];
    BOOL isMatch = [pred evaluateWithObject:CheJiaNumber];
    return isMatch;
}

@end
