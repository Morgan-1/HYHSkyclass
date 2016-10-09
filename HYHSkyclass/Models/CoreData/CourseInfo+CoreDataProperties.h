//
//  CourseInfo+CoreDataProperties.h
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import "CourseInfo+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CourseInfo (CoreDataProperties)

+ (NSFetchRequest<CourseInfo *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSNumber *cid;
@property (nullable, nonatomic, copy) NSString *cno;
@property (nullable, nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
