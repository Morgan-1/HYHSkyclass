//
//  HYHDBTool.m
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/9.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import "HYHDBTool.h"
#import "HYHOpenCourse.h"
#import "HYHCourse.h"
#import "HYHCourseInfo.h"
#import "HYHCourseSection.h"
#import "HYHCourseItem.h"
#import "HYHNews.h"
#import "HYHArticle.h"
#import "HYHLog.h"

#import "Course+CoreDataClass.h"
#import "OpenCourse+CoreDataClass.h"
#import "CourseInfo+CoreDataClass.h"
#import "CourseSection+CoreDataClass.h"
#import "CourseItem+CoreDataClass.h"
#import "News+CoreDataClass.h"
#import "Article+CoreDataClass.h"
#import "Log+CoreDataClass.h"

static NSString *openCourseEntityName = @"OpenCourse";
static NSString *courseEntityName = @"Course";
static NSString *courseInfoEntityName = @"CourseInfo";
static NSString *courseSectionEntityName = @"CourseSection";
static NSString *courseItemEntityName = @"CourseItem";
static NSString *newsEntityName = @"News";
static NSString *logEntityName = @"Log";

@implementation HYHDBTool
#pragma mark - 插入操作

+ (void)insertNewOpenCourses:(NSArray *)array{

    for (HYHOpenCourse *openCourse in array) {
        if (![self hasOpenCourse:openCourse]) {
            OpenCourse *openCourseObj = [NSEntityDescription insertNewObjectForEntityForName:openCourseEntityName inManagedObjectContext:appDelegate.managedObjectContext];
            [openCourseObj setDataWithOpenCourseModel:openCourse];
            [appDelegate saveContext];
        }
    }
}

+ (void)insertNewCourses:(NSArray *)array{

    for (HYHCourse *course in array) {
        if (![self hasCourse:course]) {
            Course *courseObj = [NSEntityDescription insertNewObjectForEntityForName:courseEntityName inManagedObjectContext:appDelegate.managedObjectContext];
            [courseObj setDataWithCourseModel:course];
            [appDelegate saveContext];
        }
    }
}

+ (void)insertNewCourseInfos:(NSArray *)array{

    for (HYHCourseInfo * courseInfo in array) {
        if (![self hasCourseInfo:courseInfo]) {
            CourseInfo *courseInfoObj = [NSEntityDescription insertNewObjectForEntityForName:courseInfoEntityName inManagedObjectContext:appDelegate.managedObjectContext];
            [courseInfoObj setDataWithCourseInfoModel:courseInfo];
            [appDelegate saveContext];
        }
    }
}

+ (void)insertNewCourseSections:(NSArray *)array{

    for (HYHCourseSection * courseSection in array) {
        if (![self hasCourseSection:courseSection]) {
            CourseSection *courseSectionObj = [NSEntityDescription insertNewObjectForEntityForName:courseSectionEntityName inManagedObjectContext:appDelegate.managedObjectContext];
            [courseSectionObj setDataWithCourseSectionModel:courseSection];
            [appDelegate saveContext];
        }
    }
}

+ (void)insertNewCourseItems:(NSArray *)array{

    for (HYHCourseItem * courseItem in array) {
        if (![self hasCourseItem:courseItem]) {
            CourseItem *courseItemObj = [NSEntityDescription insertNewObjectForEntityForName:courseItemEntityName inManagedObjectContext:appDelegate.managedObjectContext];
            [courseItemObj setDataWithCourseItemModel:courseItem];
            [appDelegate saveContext];
        }
    }
}


#pragma mark - 更新操作

+ (void)updateCourseItems:(NSArray *)array{

    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:courseItemEntityName inManagedObjectContext:appDelegate.managedObjectContext];
    for (HYHCourseItem *courseItem  in array) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"itemID=%ld", courseItem.itemID];
        request.predicate = predicate;
        
        NSError *error = nil;
        NSArray *objs = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
        if (objs && objs.count) {
            CourseItem *managedCourseItem = objs[0];
            [managedCourseItem setDataWithCourseItemModel:courseItem];
            [appDelegate saveContext];
        }
        

    }
}
#pragma mark - 查询操作
+ (NSArray *)getOpenCourseBefore:(HYHOpenCourse *)oldOpenCourse{

    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    request.entity = [NSEntityDescription entityForName:openCourseEntityName inManagedObjectContext:appDelegate.managedObjectContext];
    if (oldOpenCourse) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"openCourseID<%ld", oldOpenCourse.openCourseID ];
        request.predicate = predicate;
        request.fetchLimit = 20;
    }
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"openCourseID" ascending:NO];
    request.sortDescriptors = @[sort];
    NSError *error = nil;
    NSArray *objs = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    if (error) {
        [NSException raise:@"查询错误" format:@"%@",[error localizedDescription]];
        
    }
    return [HYHOpenCourse arrayOfOpenCourseFromManagedObjArray:objs];
}

+ (NSArray *)getAllOpenCourses{

    return [self getOpenCourseBefore:nil];
}

+ (NSArray *)getAllCourse{

    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    request.entity = [NSEntityDescription entityForName:courseEntityName inManagedObjectContext:appDelegate.managedObjectContext];
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"courseID" ascending:NO];
    request.sortDescriptors = @[sort];
    
    NSError *error = nil;
    NSArray *objs = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    if (error) {
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    if (objs && objs.count > 0) {
        return [HYHCourse arrayOfCourseFromManagedObjArray:objs];
    }else{
    
        return nil;
    }
}

+ (HYHCourseInfo *)getCourseInfoByCourse:(HYHCourse *)course{

    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    request.entity = [NSEntityDescription entityForName:courseInfoEntityName inManagedObjectContext:appDelegate.managedObjectContext];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"cno=%@", course.courseCode];
    request.predicate = predicate;
    
    NSError *error = nil;
    NSArray *objs = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    if (error) {
        [NSException raise:@"查询错误" format:@"%@",[error localizedDescription]];
    }
    if (objs && objs.count > 0) {
        CourseInfo *courseInfoObj = (CourseInfo *)objs.firstObject;
        HYHCourseInfo *courseInfo = [[HYHCourseInfo alloc]initWithManagedObj:courseInfoObj];
        return courseInfo;
    }
    else{
    
        if(objs.count > 1){
            CQLog(@"通过course找到的courseInfo数量大于1");
        }
        return nil;

    }

}
+ (NSArray *)getCourseSectionsByCourse:(HYHCourse *)course{
    HYHCourseInfo *courseInfo = [self getCourseInfoByCourse:course];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:courseSectionEntityName inManagedObjectContext:appDelegate.managedObjectContext];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"cid=%ld", courseInfo.cid];
    request.predicate = predicate;
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"sectionID" ascending:YES];
    request.sortDescriptors = @[sort];
    
    NSError *error = nil;
    NSArray *objs = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    if(error){
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    if(objs && objs.count>0){
        return [HYHCourseSection arrayOfCourseSectionFromManagedObjArray:objs];
    }
    else{
        return nil;
    }
}

+ (NSArray *)getCourseItemsByCourseSection:(HYHCourseSection *)courseSection{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:courseItemEntityName inManagedObjectContext:appDelegate.managedObjectContext];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"sectionID=%ld", courseSection.sectionID];
    request.predicate = predicate;
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"itemID" ascending:YES];
    request.sortDescriptors = @[sort];
    
    NSError *error = nil;
    NSArray *objs = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    if(error){
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    
    if(objs && objs.count>0){
        return [HYHCourseItem arrayOfCourseItemFromManagedObjArray:objs];
    }
    else{
        return nil;
    }
}



#pragma mark - 判断是否存在
+ (BOOL)hasOpenCourse:(HYHOpenCourse *)openCourse{

    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    request.entity = [NSEntityDescription entityForName:openCourseEntityName inManagedObjectContext:appDelegate.managedObjectContext];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"openCourseID=%ld", openCourse.openCourseID ];
    request.predicate = predicate;
    
    NSError *error = nil;
    NSArray *objs = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    if (error) {
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    return  objs && objs.count != 0;
}

+ (BOOL)hasCourse:(HYHCourse *)course{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:courseEntityName inManagedObjectContext:appDelegate.managedObjectContext];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"courseID=%ld", course.courseID];
    request.predicate = predicate;
    
    NSError *error = nil;
    NSArray *objs = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    if(error){
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    
    return objs && objs.count!=0;
}

+ (BOOL)hasCourseInfo:(HYHCourseInfo *)courseInfo{

    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:courseInfoEntityName inManagedObjectContext:appDelegate.managedObjectContext];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"cid=%ld", courseInfo.cid];
    request.predicate = predicate;
    
    NSError *error = nil;
    NSArray *objs = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    if(error){
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    
    return objs && objs.count!=0;
}

+ (BOOL)hasCourseSection:(HYHCourseSection *)courseSection{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:courseSectionEntityName inManagedObjectContext:appDelegate.managedObjectContext];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"sectionID=%ld", courseSection.sectionID];
    request.predicate = predicate;
    
    NSError *error = nil;
    NSArray *objs = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    if(error){
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    
    return objs && objs.count!=0;

    
}

+ (BOOL)hasCourseItem:(HYHCourseItem *)courseItem{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:courseItemEntityName inManagedObjectContext:appDelegate.managedObjectContext];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"itemID=%ld", courseItem.itemID];
    request.predicate = predicate;
    
    NSError *error = nil;
    NSArray *objs = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    if(error){
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    
    return objs && objs.count!=0;

    
}
#pragma mark - 日志数据处理


+ (void)insertNewLog:(HYHLog *)log{
    if(log){
        Log *logObj = [NSEntityDescription insertNewObjectForEntityForName:logEntityName inManagedObjectContext:appDelegate.managedObjectContext];
        [logObj setDataWithLogModel:log];
        [appDelegate saveContext];
    }
}

+ (NSArray *)getAllLogs{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:logEntityName inManagedObjectContext:appDelegate.managedObjectContext];
    
    NSError *error = nil;
    NSArray *objs = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    if(error){
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    
    if(objs && objs.count>0){
        return [HYHLog arrayOfLogFromManagedObjArray:objs];
    }
    else{
        return nil;
    }
}

+ (BOOL)removeAllLogs{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:logEntityName inManagedObjectContext:appDelegate.managedObjectContext];
    
    NSError *error = nil;
    NSArray *objs = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    if(error){
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    
    if(objs && objs.count>0){
        for (Log *logObj in objs) {
            [appDelegate.managedObjectContext deleteObject:logObj];
        }
        [appDelegate saveContext];
        
        return YES;
    }
    return NO;
}

@end

