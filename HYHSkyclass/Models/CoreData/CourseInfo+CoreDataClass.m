//
//  CourseInfo+CoreDataClass.m
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import "CourseInfo+CoreDataClass.h"
#import "HYHCourseInfo.h"
@implementation CourseInfo

- (void)setDataWithCourseInfoModel:(HYHCourseInfo *)courseInfo{
    self.cid = [NSNumber numberWithInteger:courseInfo.cid];
    self.cno = courseInfo.courseCode;
    self.name = courseInfo.CourseName;
}

@end
