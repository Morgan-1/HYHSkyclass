//
//  CourseItem+CoreDataClass.m
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import "CourseItem+CoreDataClass.h"
#import "HYHCourseItem.h"
@implementation CourseItem

- (void)setDataWithCourseItemModel:(HYHCourseItem *)courseItem{
    self.cid = [NSNumber numberWithInteger:courseItem.cid];
    self.itemID = [NSNumber numberWithInteger:courseItem.itemID];
    self.sectionID = [NSNumber numberWithInteger:courseItem.sectionID];
    self.isWatched = [NSNumber numberWithBool:courseItem.isWatched];
    self.name = courseItem.itemName;
    self.ttime = courseItem.ttime;
    self.tvPath = courseItem.tvPath;
    self.tvPicPath = courseItem.tvPicPath;
    self.svPath = courseItem.svPath;
    self.svPicPath = courseItem.svPicPath;
}

@end
