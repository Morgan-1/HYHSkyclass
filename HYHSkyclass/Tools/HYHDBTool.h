//
//  HYHDBTool.h
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/9.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HYHOpenCourse;
@class HYHCourse;
@class HYHCourseInfo;
@class HYHCourseSection;
@class HYHCourseItem;
@class HYHNews;
@class HYHArticle;
@class HYHLog;


@interface HYHDBTool : NSObject

+ (void)insertNewOpenCourses:(NSArray *)array;

+ (void)insertNewCourses:(NSArray *)array;

//点播课程的插入
+ (void)insertNewCourseInfos:(NSArray *)array;

+ (void)insertNewCourseSections:(NSArray *)array;

+ (void)insertNewCourseItems:(NSArray *)array;

//  点播课程更新
+ (void)updateCourseItems:(NSArray *)array;

//点播课程查找
+ (void)getCourseSectionByCourse:(HYHCourse *)course;

+ (void)getCourseItemByCourseSection:(HYHCourseSection *)courseSection;

//获取公开课
+ (NSArray *)getOpenCourseBefore:(HYHOpenCourse *)oldOpenCourse;

+ (NSArray *)getAllOpenCourses;

//获取所有课程数据

+ (NSArray *)getAll;

//日志数据的获取

+ (void)insertNewLog:(HYHLog *)log;

+ (NSArray *)getAllLogs;

+ (BOOL)removeAllLogs;

@end
