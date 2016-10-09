//
//  HYHCourse.h
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/8.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Course;
@interface HYHCourse : NSObject

@property(nonatomic, assign) NSInteger courseID;

@property(nonatomic, copy) NSString *courseCode;

@property(nonatomic, copy) NSString *courseName;

- (instancetype)initWithDict:(NSDictionary *)dict;

- (instancetype)initManagedObj:(Course *)course;

+ (NSArray *)arrayOfCourseFromManagedObjArray:(NSArray *)objs;


@end
