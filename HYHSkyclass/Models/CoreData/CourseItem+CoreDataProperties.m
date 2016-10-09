//
//  CourseItem+CoreDataProperties.m
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import "CourseItem+CoreDataProperties.h"

@implementation CourseItem (CoreDataProperties)

+ (NSFetchRequest<CourseItem *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CourseItem"];
}

@dynamic cid;
@dynamic isWatched;
@dynamic itemID;
@dynamic name;
@dynamic sectionID;
@dynamic svPath;
@dynamic svPicPath;
@dynamic ttime;
@dynamic tvPath;
@dynamic tvPicPath;

@end
