//
//  HYHOpenCourse.h
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/8.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class OpenCourse;
@interface HYHOpenCourse : NSObject

@property(nonatomic, assign) NSInteger openCourseID;

@property(nonatomic, assign) NSInteger videoID;

@property(nonatomic, assign) NSInteger clickCount;

@property(nonatomic, copy) NSString *authorName;

@property(nonatomic, copy) NSString *createTime;

@property(nonatomic, copy) NSString *videoName;

@property(nonatomic, copy) NSString *videoUrl;

@property(nonatomic, copy) NSString *pictureUrl;


//是否已经看过这个视频
@property(nonatomic, assign) BOOL isWatched;


//下面的属性是不存数据库的

@property(nonatomic, strong) NSDate *createDate;

- (instancetype)initWithDict:(NSDictionary *)dict;

- (instancetype)initManagedObj:(OpenCourse *)openCourse;

+ (NSArray *)arrayOfOpenCourseFromManagedObjArray:(NSArray *)objs;


@end
