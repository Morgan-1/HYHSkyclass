//
//  Article+CoreDataProperties.m
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import "Article+CoreDataProperties.h"

@implementation Article (CoreDataProperties)

+ (NSFetchRequest<Article *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Article"];
}

@dynamic articleID;
@dynamic beginDate;
@dynamic createTime;
@dynamic endDate;
@dynamic infoLevel;
@dynamic localPath;
@dynamic mainHead;
@dynamic sendObjectID;
@dynamic typeName;

@end
