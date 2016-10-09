//
//  HYHCourse.m
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/8.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import "HYHCourse.h"
#import "Course+CoreDataProperties.h"
@implementation HYHCourse
- (instancetype)initWithDict:(NSDictionary *)dict{

    self = [super init];
    if (self) {
        self.courseID = ((NSString *)dict[@"CourseID"]).integerValue;
        self.courseCode = dict[@"CourseCode"];
        self.courseName = dict[@"CourseName"];
    }
    return self;
}

- (instancetype)initManagedObj:(Course *)course{

    self = [super init];
    if (self) {
        self.courseID  = course.courseID.integerValue;
        self.courseCode = course.courseCode;
        self.courseName = course.courseName;
    }
    return self;
}

+ (NSArray *)arrayOfCourseFromManagedObjArray:(NSArray *)objs{

    NSMutableArray *mArray = [NSMutableArray array];
    for (Course *courseObj in objs) {
        HYHCourse *course = [[self alloc] initManagedObj:courseObj];
        [mArray addObject:course];
    }
    return mArray;
}
@end
