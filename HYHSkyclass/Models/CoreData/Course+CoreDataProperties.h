//
//  Course+CoreDataProperties.h
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import "Course+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Course (CoreDataProperties)

+ (NSFetchRequest<Course *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *courseCode;
@property (nullable, nonatomic, copy) NSNumber *courseID;
@property (nullable, nonatomic, copy) NSString *courseName;

@end

NS_ASSUME_NONNULL_END
