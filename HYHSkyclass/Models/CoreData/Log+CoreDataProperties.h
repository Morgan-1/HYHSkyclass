//
//  Log+CoreDataProperties.h
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import "Log+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Log (CoreDataProperties)

+ (NSFetchRequest<Log *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *beginTime;
@property (nullable, nonatomic, copy) NSString *courseCode;
@property (nullable, nonatomic, copy) NSString *duration;
@property (nullable, nonatomic, copy) NSString *operationCode;
@property (nullable, nonatomic, copy) NSString *paltformCode;
@property (nullable, nonatomic, copy) NSString *studentCode;
@property (nullable, nonatomic, copy) NSString *videoName;

@end

NS_ASSUME_NONNULL_END
