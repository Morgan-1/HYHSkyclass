//
//  HYHHttpTool.h
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/9.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYHHttpTool : NSObject


+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

+ (void)post:(NSString *)url params:(NSDictionary *)params constructingBodyWithBlock:(void (^)(id formData))block success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

+ (void)soap:(NSString *)url params:(NSDictionary *)params success:(void (^)(NSString *xmls))success failure:(void (^)(NSError *error))failure;

+ (void)cus_post:(NSString *)url params:(NSString *)params success:(void (^)(NSString *returnStr))success failure:(void (^)(NSError *error))failure;

+ (void)cus_get:(NSString *)url params:(NSString *)params success:(void (^)(NSString *returnStr))success failure:(void (^)(NSError *error))failure;

+ (BOOL)isNetworkReachable;

+ (BOOL)isDomainReacheable:(NSString *)domain;


@end
