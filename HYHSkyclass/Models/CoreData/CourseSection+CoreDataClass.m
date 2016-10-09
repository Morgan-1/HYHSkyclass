//
//  CourseSection+CoreDataClass.m
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import "CourseSection+CoreDataClass.h"
#import "HYHCourseSection.h"
@implementation CourseSection

- (void)setDataWithCourseSectionModel:(HYHCourseSection *)courseSection{
    self.cid = [NSNumber numberWithInteger:courseSection.cid];
    self.sectionID = [NSNumber numberWithInteger:courseSection.sectionID];
    self.name = courseSection.sectionName;
}

@end
