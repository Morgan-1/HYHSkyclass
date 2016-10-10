//
//  HYHOpenCourseManager.m
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/10.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import "HYHOpenCourseManager.h"
#import "HYHHttpTool.h"
#import "HYHDBTool.h"

#import "HYHOpenCourse.h"

@interface HYHOpenCourseManager () <NSXMLParserDelegate>

@end

@implementation HYHOpenCourseManager

+ (instancetype)manager{

    static HYHOpenCourseManager *openCourseManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        openCourseManager = [[self alloc]init];
    });
    return openCourseManager;
}

- (void)fetchOpenCoursesWithCompleteBlock:(void (^)(NSArray *))completion andFailure:(void (^)(NSError *))failure fromServer:(BOOL)requestServer{
 
    if (!requestServer) {
        NSArray *openCourses = [HYHDBTool getAllOpenCourses];
        if (openCourses && openCourses.count) {
            completion(openCourses);
            return;
        }
    }
    
    NSString *url = @"http://publiccourselist.xjtudlc.com";
    [HYHHttpTool soap:url params:nil success:^(NSString *xmls) {
        NSRange startRange = [xmls rangeOfString:@"<GetPublicCourseListResult>"];
        NSInteger startIndex = startRange.location + startRange.length - 1;
        NSRange endRange = [xmls rangeOfString:@"}</GetPublicCourseListResult>"];
        NSInteger endIndex = endRange.location;
        
        NSString *json = [xmls substringWithRange:NSMakeRange(startIndex, endIndex-startIndex + 1)];
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
        
        NSArray *data = dict[@"Data"];
        
        NSMutableArray *mArray = [NSMutableArray array];
        for(NSDictionary *dictionary in data){
            HYHOpenCourse *openCourse = [[HYHOpenCourse alloc] initWithDict:dictionary];
            [mArray addObject:openCourse];
        }
        
        //这里还有一步存数据库, 插入时候会判断是否数据库中已经有此数据（以id作为判断，默认已有信息是不会改变的）
        [HYHDBTool insertNewOpenCourses:mArray];
        
        completion(mArray);
        
    } failure:^(NSError *error) {
        failure(error);
    }];
}

- (BOOL)isOpenCourseReachable{

    return [HYHHttpTool isNetworkReachable];
}

@end
