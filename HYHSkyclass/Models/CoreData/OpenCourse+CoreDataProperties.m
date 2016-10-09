//
//  OpenCourse+CoreDataProperties.m
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import "OpenCourse+CoreDataProperties.h"

@implementation OpenCourse (CoreDataProperties)

+ (NSFetchRequest<OpenCourse *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"OpenCourse"];
}

@dynamic authorName;
@dynamic clickCount;
@dynamic createTime;
@dynamic isWatched;
@dynamic openCourseID;
@dynamic pictureUrl;
@dynamic videoID;
@dynamic videoName;
@dynamic videoSize;
@dynamic videoUrl;

@end
