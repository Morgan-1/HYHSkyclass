//
//  OpenCourse+CoreDataProperties.h
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import "OpenCourse+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface OpenCourse (CoreDataProperties)

+ (NSFetchRequest<OpenCourse *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *authorName;
@property (nullable, nonatomic, copy) NSNumber *clickCount;
@property (nullable, nonatomic, copy) NSString *createTime;
@property (nullable, nonatomic, copy) NSNumber *isWatched;
@property (nullable, nonatomic, copy) NSNumber *openCourseID;
@property (nullable, nonatomic, copy) NSString *pictureUrl;
@property (nullable, nonatomic, copy) NSNumber *videoID;
@property (nullable, nonatomic, copy) NSString *videoName;
@property (nullable, nonatomic, copy) NSString *videoSize;
@property (nullable, nonatomic, copy) NSString *videoUrl;

@end

NS_ASSUME_NONNULL_END
