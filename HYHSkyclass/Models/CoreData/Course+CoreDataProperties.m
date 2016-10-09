//
//  Course+CoreDataProperties.m
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import "Course+CoreDataProperties.h"

@implementation Course (CoreDataProperties)

+ (NSFetchRequest<Course *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Course"];
}

@dynamic courseCode;
@dynamic courseID;
@dynamic courseName;

@end
