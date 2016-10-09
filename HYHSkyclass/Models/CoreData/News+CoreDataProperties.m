//
//  News+CoreDataProperties.m
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import "News+CoreDataProperties.h"

@implementation News (CoreDataProperties)

+ (NSFetchRequest<News *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"News"];
}

@dynamic content;
@dynamic desc;
@dynamic keywords;
@dynamic newsID;
@dynamic title;

@end
