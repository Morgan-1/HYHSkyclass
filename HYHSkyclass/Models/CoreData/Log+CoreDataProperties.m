//
//  Log+CoreDataProperties.m
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import "Log+CoreDataProperties.h"

@implementation Log (CoreDataProperties)

+ (NSFetchRequest<Log *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Log"];
}

@dynamic beginTime;
@dynamic courseCode;
@dynamic duration;
@dynamic operationCode;
@dynamic paltformCode;
@dynamic studentCode;
@dynamic videoName;

@end
