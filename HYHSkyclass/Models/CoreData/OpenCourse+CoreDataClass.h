//
//  OpenCourse+CoreDataClass.h
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@class HYHOpenCourse;
NS_ASSUME_NONNULL_BEGIN

@interface OpenCourse : NSManagedObject
- (void)setDataWithOpenCourseModel:(HYHOpenCourse *)openCourse;
@end

NS_ASSUME_NONNULL_END

#import "OpenCourse+CoreDataProperties.h"
