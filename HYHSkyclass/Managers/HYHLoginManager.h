//
//  HYHLoginManager.h
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/9.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYHLoginManager : NSObject

+ (instancetype)manager;

- (BOOL)isLogin;

- (void)logOff;

- (void)loginWithUserName:(NSString *)userName encyptedPassword:(NSString *)password success:(void (^) (BOOL status))success failure:(void (^) (NSError *error))failure;
@end
