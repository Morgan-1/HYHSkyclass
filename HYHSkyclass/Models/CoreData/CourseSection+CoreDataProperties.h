//
//  CourseSection+CoreDataProperties.h
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import "CourseSection+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CourseSection (CoreDataProperties)

+ (NSFetchRequest<CourseSection *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSNumber *cid;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSNumber *sectionID;

@end

NS_ASSUME_NONNULL_END
