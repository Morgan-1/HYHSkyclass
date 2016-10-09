//
//  HYHAccountTool.m
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/9.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import "HYHAccountTool.h"

static NSString *studentCode = @"StudentCode";

@implementation HYHAccountTool

+ (BOOL)isLogin{

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if ([userDefaults stringForKey:studentCode]) {
        return YES;
    }else{
    
        return NO;
    }
}

+ (void)logOff{

    if ([self isLogin]) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults removeObjectForKey:studentCode];
    }
}

+ (void)setLoginInfoWithStudentCode:(NSString *)string{

    if (![self isLogin]) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:string forKey:studentCode];
    }
}

+ (NSString *)getStudentCode{

    if ([self isLogin]) {
        return [[NSUserDefaults standardUserDefaults] stringForKey:studentCode];
    }
    else{
    
        return nil;
    }
}
@end
