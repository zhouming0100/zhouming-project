//
//  NSString+Validate.m
//  OYOConsumer
//
//  Created by heyahui on 2018/8/6.
//  Copyright © 2018年 www.oyohotels.cn. All rights reserved.
//

#import "NSString+Validate.h"

@implementation NSString (Validate)


+ (BOOL)validateString:(NSString *)string pattern:(NSStringValidatePattern)pattern {
    BOOL valid = false;
    NSString *patternString = [self getPatternStringFrom:pattern];
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:patternString options:NSRegularExpressionCaseInsensitive error:&error];
    NSRange textRange = NSMakeRange(0, string.length);
    NSRange matchRange = [regex rangeOfFirstMatchInString:string options:NSMatchingReportProgress range:textRange];
    if (matchRange.location != NSNotFound)
        valid = true;
    return valid;
}

+ (NSString *)getPatternStringFrom:(NSStringValidatePattern)pattern {
    NSString *patternStirng;
    switch (pattern) {
        case NSStringValidatePatternPhoneNumber:
            patternStirng = @"^(1[0-9])\\d{9}$";
            break;
        case NSStringValidatePatternSMSCode:
            patternStirng = @"^([0-9])\\d{5}$";
            break;
        case NSStringValidatePatternEmail:
            patternStirng = @"\\w[-\\w.!#$%&'*+-/=?^_`{|}~+]*@([A-Za-z0-9][-A-Za-z0-9]+\\.)+[A-Za-z]{2,14}";
            break;
        case NSStringValidatePatternWordAndNumber:
            patternStirng = @"[a-zA-Z0-9]";
            break;
        case NSStringValidatePatternNumber:
            patternStirng = @"[0-9]";
            break;
        default:
            patternStirng = @"^([0-9])\\d{5}$";
            break;
    }
    return patternStirng;
}


+ (BOOL)isAllNum:(NSString *)checkedNumString {
    checkedNumString = [checkedNumString stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(checkedNumString.length > 0) {
        return NO;
    }
    return YES;
}


/**
 验证某个字符串是否符合某个规则
 
 @param regexString 规则
 @return            返回是否符合规则
 */
- (BOOL)validateRegexString:(NSString *)regexString {
    if (!regexString.length) {
        return NO;
    }
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexString];
    return [predicate evaluateWithObject:self];
}

- (BOOL)validateRegexForm:(NSStringValidatePattern)pattern {
    NSString *patternString = [self.class getPatternStringFrom:pattern];
    return [self validateRegexString:patternString];
}

@end
