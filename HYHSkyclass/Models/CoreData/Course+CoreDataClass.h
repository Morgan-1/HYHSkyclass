//
//  Course+CoreDataClass.h
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN
@class HYHCourse;
@interface Course : NSManagedObject
- (void)setDataWithCourseModel:(HYHCourse *)course;

@end

NS_ASSUME_NONNULL_END

#import "Course+CoreDataProperties.h"
