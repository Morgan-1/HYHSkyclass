//
//  CourseItem+CoreDataProperties.h
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import "CourseItem+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CourseItem (CoreDataProperties)

+ (NSFetchRequest<CourseItem *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSNumber *cid;
@property (nullable, nonatomic, copy) NSNumber *isWatched;
@property (nullable, nonatomic, copy) NSNumber *itemID;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSNumber *sectionID;
@property (nullable, nonatomic, copy) NSString *svPath;
@property (nullable, nonatomic, copy) NSString *svPicPath;
@property (nullable, nonatomic, copy) NSString *ttime;
@property (nullable, nonatomic, copy) NSString *tvPath;
@property (nullable, nonatomic, copy) NSString *tvPicPath;

@end

NS_ASSUME_NONNULL_END
