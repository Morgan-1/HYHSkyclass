//
//  News+CoreDataProperties.h
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import "News+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface News (CoreDataProperties)

+ (NSFetchRequest<News *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *content;
@property (nullable, nonatomic, copy) NSString *desc;
@property (nullable, nonatomic, copy) NSString *keywords;
@property (nullable, nonatomic, copy) NSNumber *newsID;
@property (nullable, nonatomic, copy) NSString *title;

@end

NS_ASSUME_NONNULL_END
