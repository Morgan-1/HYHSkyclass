//
//  HYHAccountTool.h
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/9.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYHAccountTool : NSObject

+ (BOOL)isLogin;

+ (void)logOff;

+ (void)setLoginInfoWithStudentCode:(NSString *)string;

+ (NSString *)getStudentCode;

@end
