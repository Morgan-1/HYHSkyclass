//
//  Course+CoreDataClass.m
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import "Course+CoreDataClass.h"
#import "HYHCourse.h"
@implementation Course

- (void)setDataWithCourseModel:(HYHCourse *)course{
    self.courseID = [NSNumber numberWithInteger:course.courseID];
    self.courseCode = course.courseCode;
    self.courseName = course.courseName;
}

@end
