//
//  NSString+Validate.h
//  OYOConsumer
//
//  Created by heyahui on 2018/8/6.
//  Copyright © 2018年 www.oyohotels.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, NSStringValidatePattern) {
    NSStringValidatePatternPhoneNumber,   //校验是否是手机号
    NSStringValidatePatternSMSCode,       //校验是否是验证码
    NSStringValidatePatternEmail,         //校验是否是邮箱
    NSStringValidatePatternWordAndNumber, //校验是否是字母和数字
    NSStringValidatePatternNumber,        //校验 仅为数字
};

@interface NSString (Validate)


/**
 获取输入的字符串是否合法

 @param string 输入的字符串
 @param pattern 需要校验的格式
 @return 返回是否合法
 */
+ (BOOL)validateString:(NSString *)string pattern:(NSStringValidatePattern)pattern;

+ (BOOL)isAllNum:(NSString *)checkedNumString;

/**
 校验正则代码

 @param regexString 正则规则
 @return yes 通过， no 不通过
 */
- (BOOL)validateRegexString:(NSString *)regexString;

/**
 校验正则规则

 @param pattern 枚举正则
 @return yes 通过， no 不通过
 */
- (BOOL)validateRegexForm:(NSStringValidatePattern)pattern;

@end
