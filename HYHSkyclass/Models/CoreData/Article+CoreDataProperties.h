//
//  Article+CoreDataProperties.h
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import "Article+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Article (CoreDataProperties)

+ (NSFetchRequest<Article *> *)fetchRequest;

@property (nonatomic) int32_t articleID;
@property (nullable, nonatomic, copy) NSString *beginDate;
@property (nullable, nonatomic, copy) NSString *createTime;
@property (nullable, nonatomic, copy) NSString *endDate;
@property (nullable, nonatomic, copy) NSString *infoLevel;
@property (nullable, nonatomic, copy) NSString *localPath;
@property (nullable, nonatomic, copy) NSString *mainHead;
@property (nullable, nonatomic, copy) NSString *sendObjectID;
@property (nullable, nonatomic, copy) NSString *typeName;

@end

NS_ASSUME_NONNULL_END
