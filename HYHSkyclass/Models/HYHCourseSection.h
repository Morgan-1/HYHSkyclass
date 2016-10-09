//
//  HYHCourseSection.h
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/8.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CourseSection;
@interface HYHCourseSection : NSObject

@property(nonatomic, assign) NSInteger cid;

@property(nonatomic, assign) NSInteger sectionID;

@property(nonatomic, copy) NSString *sectionName;

@property(nonatomic, assign) BOOL isShow;

- (instancetype)initWithDict:(NSDictionary *)dict;

- (instancetype)initWithManagedObj:(CourseSection *)courseSectionObj;

/**
 *  将NSManagedObject数组转换成模型数组
 *
 *  @param objs 包含CourseSection（NSManagedObject）对象的数组
 *
 *  @return 包含SCCourseSection对象的数组
 */
+ (NSArray *)arrayOfCourseSectionFromManagedObjArray:(NSArray *)objs;


@end
