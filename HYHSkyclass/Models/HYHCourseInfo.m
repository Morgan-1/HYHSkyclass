//
//  HYHCourseInfo.m
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/8.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import "HYHCourseInfo.h"
#import "CourseInfo+CoreDataClass.h"
@implementation HYHCourseInfo

- (instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if(self){
        NSString *idStr = dict[@"id"];
        
        self.cid = idStr.integerValue;
        self.courseCode = dict[@"cno"];
        self.CourseName = dict[@"name"];
    }
    return self;
}

- (instancetype)initWithManagedObj:(CourseInfo *)courseInfoObj{
    self = [super init];
    if(self){
        self.cid = courseInfoObj.cid.integerValue;
        self.courseCode = courseInfoObj.cno;
        self.CourseName = courseInfoObj.name;
    }
    return self;
}

@end
