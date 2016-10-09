//
//  CourseInfo+CoreDataProperties.m
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import "CourseInfo+CoreDataProperties.h"

@implementation CourseInfo (CoreDataProperties)

+ (NSFetchRequest<CourseInfo *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CourseInfo"];
}

@dynamic cid;
@dynamic cno;
@dynamic name;

@end
