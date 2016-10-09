//
//  HYHLoginManager.m
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/9.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import "HYHLoginManager.h"
#import "HYHAccountTool.h"
#import "HYHHttpTool.h"
#import "HYHDBTool.h"
#import "HYHCourse.h"

@implementation HYHLoginManager

+ (instancetype)manager{

    static HYHLoginManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self  alloc]init];
    });
    return manager;
}

- (BOOL)isLogin{

    return [HYHAccountTool isLogin];
}

- (void)logOff{

    [HYHAccountTool logOff];
}

- (void)loginWithUserName:(NSString *)userName encyptedPassword:(NSString *)password success:(void (^)(BOOL))success failure:(void (^)(NSError *))failure{

    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"name"] = userName;
    dict[@"password"] = password;
    
    [HYHHttpTool post:@"http://xueli.xjtudlc.com/MobileLearning/loginCheck.aspx" params:dict success:^(id responseObj) {
        NSMutableArray *mArray = [responseObj mutableCopy];
        
        NSDictionary *studentDict = [mArray objectAtIndex: 0];
        [mArray removeObject:studentDict];
        [self saveStudentInfo:studentDict];
        
        [self saveCoursesToDB:mArray];
        success(YES);
        
    } failure:^(NSError *error) {
        failure(error);

    }];
    NSLog(@"finished post");

}

- (void)saveStudentInfo:(NSDictionary *)dict{
    NSString *studentCode = dict[@"StudentCode"];
    [HYHAccountTool setLoginInfoWithStudentCode:studentCode];
    NSLog(@"ready to save student code : %@", studentCode);
}

/**
 *  将courses数据存入数据库中
 *
 *  @param courses 数组中包含的course数据的dictionary
 */
- (void)saveCoursesToDB:(NSArray *)courses{
    NSLog(@"准备写入数据库的Course : %@", courses);
    
    NSMutableArray *mCourses = [NSMutableArray array];
    for(NSDictionary *dict in courses){
        HYHCourse *course = [[HYHCourse alloc] initWithDict:dict];
        [mCourses addObject:course];
    }
    
    [HYHDBTool insertNewCourses:mCourses];
}

@end
