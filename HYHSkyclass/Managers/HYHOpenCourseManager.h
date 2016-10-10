//
//  HYHOpenCourseManager.h
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/10.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYHOpenCourseManager : NSObject


+ (instancetype)manager;

/**
 *  为了适配服务器返回数据方式，采取了系统原生的请求方式，同时以同步方式进行请求
 *  第二次之后访问的话优先去数据库中查询
 *
 *  @param completion 拿到返回数据之后调用的block
 *
 *  @return void
 */
- (void)fetchOpenCoursesWithCompleteBlock:(void (^)(NSArray *array))completion andFailure:(void (^)(NSError *error))failure fromServer:(BOOL)requestServer;

- (BOOL)isOpenCourseReachable;



@end
