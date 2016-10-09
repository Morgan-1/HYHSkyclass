//
//  CourseSection+CoreDataProperties.m
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import "CourseSection+CoreDataProperties.h"

@implementation CourseSection (CoreDataProperties)

+ (NSFetchRequest<CourseSection *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CourseSection"];
}

@dynamic cid;
@dynamic name;
@dynamic sectionID;

@end
