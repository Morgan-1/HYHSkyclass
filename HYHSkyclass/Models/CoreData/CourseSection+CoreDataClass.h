//
//  CourseSection+CoreDataClass.h
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN
@class HYHCourseSection;
@interface CourseSection : NSManagedObject
- (void)setDataWithCourseSectionModel:(HYHCourseSection *)courseSection;

@end

NS_ASSUME_NONNULL_END

#import "CourseSection+CoreDataProperties.h"
