//
//  CourseInfo+CoreDataClass.h
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN
@class HYHCourseInfo;
@interface CourseInfo : NSManagedObject
- (void)setDataWithCourseInfoModel:(HYHCourseInfo *)courseInfo;
@end

NS_ASSUME_NONNULL_END

#import "CourseInfo+CoreDataProperties.h"
