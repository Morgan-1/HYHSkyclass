//
//  HYHCourseSection.m
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/8.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import "HYHCourseSection.h"
#import "CourseSection+CoreDataProperties.h"
@implementation HYHCourseSection

- (instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if(self){
        NSString *cidStr = dict[@"courseid"];
        NSString *sectionIdStr = dict[@"id"];
        
        self.cid = cidStr.integerValue;
        self.sectionID = sectionIdStr.integerValue;
        self.sectionName = dict[@"name"];
    }
    return self;
}

- (instancetype)initWithManagedObj:(CourseSection *)courseSectionObj{
    self = [super init];
    if(self){
        self.cid = courseSectionObj.cid.integerValue;
        self.sectionID = courseSectionObj.sectionID.integerValue;
        self.sectionName = courseSectionObj.name;
    }
    return self;
}

+ (NSArray *)arrayOfCourseSectionFromManagedObjArray:(NSArray *)objs{
    NSMutableArray *mArray = [NSMutableArray array];
    for(CourseSection *courseSectionObj in objs){
        HYHCourseSection *courseSection = [[self alloc] initWithManagedObj:courseSectionObj];
        [mArray addObject:courseSection];
    }
    return mArray;
}


@end
