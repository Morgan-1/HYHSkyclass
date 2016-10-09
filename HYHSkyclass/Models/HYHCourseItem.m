//
//  HYHCourseItem.m
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/8.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import "HYHCourseItem.h"
#import "CourseItem+CoreDataProperties.h"
@implementation HYHCourseItem


- (instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if(self){
        NSString *cidStr = dict[@"cid"];
        NSString *itemIdStr = dict[@"id"];
        NSString *sectionIdStr = dict[@"structureid"];
        
        self.cid = cidStr.integerValue;
        self.sectionID = sectionIdStr.integerValue;
        self.itemID = itemIdStr.integerValue;
        self.svPath = dict[@"svpath"];
        self.tvPath = dict[@"tvpath"];
        self.ttime = dict[@"ttime"];
        self.itemName = dict[@"name"];
    }
    return self;
}

- (instancetype)initWithManagedObj:(CourseItem *)courseItemObj{
    self = [super init];
    if(self){
        self.cid = courseItemObj.cid.integerValue;
        self.sectionID = courseItemObj.sectionID.integerValue;
        self.itemID = courseItemObj.itemID.integerValue;
        self.isWatched = courseItemObj.isWatched.boolValue;
        self.itemName = courseItemObj.name;
        self.ttime = courseItemObj.ttime;
        self.tvPath = courseItemObj.tvPath;
        self.tvPicPath = courseItemObj.tvPicPath;
        self.svPath = courseItemObj.svPath;
        self.svPicPath = courseItemObj.svPicPath;
    }
    return self;
}

+ (NSArray *)arrayOfCourseItemFromManagedObjArray:(NSArray *)objs{
    NSMutableArray *mArray = [NSMutableArray array];
    for(CourseItem *courseItemObj in objs){
        HYHCourseItem *courseItem = [[self alloc] initWithManagedObj:courseItemObj];
        [mArray addObject:courseItem];
    }
    return mArray;
}


@end
