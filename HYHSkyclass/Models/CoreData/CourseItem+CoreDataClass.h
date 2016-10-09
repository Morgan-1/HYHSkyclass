//
//  CourseItem+CoreDataClass.h
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN
@class HYHCourseItem;
@interface CourseItem : NSManagedObject

- (void)setDataWithCourseItemModel:(HYHCourseItem *)courseItem;

@end

NS_ASSUME_NONNULL_END

#import "CourseItem+CoreDataProperties.h"
