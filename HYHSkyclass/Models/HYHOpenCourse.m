//
//  HYHOpenCourse.m
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/8.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import "HYHOpenCourse.h"
#import "OpenCourse+CoreDataProperties.h"
@implementation HYHOpenCourse
//网络数据转成对象
- (instancetype)initWithDict:(NSDictionary *)dict{
    
    self = [super init];
    if (self) {
        NSString *oid = dict[@"id"];
        NSString *videoID = dict[@"VideoID"];
        NSString *videoName = dict[@"VideoName"];
        NSString *videoUrl = dict[@"VideoUrl"];
        NSString *videoCreateDate = dict[@"VideoCreateDate"];
        NSString *videoAuthorName = dict[@"VideoAuthorName"];
        NSString *videoPicUrl = dict[@"VideoPicUrl"];;
        NSString *clickCount = dict[@"ClickCount"];
        
        self.openCourseID = oid.integerValue;
        self.videoID = videoID.integerValue;
        self.clickCount = clickCount.integerValue;
        self.videoName = videoName;
        self.videoUrl = videoUrl;
        self.createTime = videoCreateDate;
        self.authorName = videoAuthorName;
        self.pictureUrl = videoPicUrl;
    }
    return  self;
    
}
//一个CoreData对象转成对象
- (instancetype)initManagedObj:(OpenCourse *)openCourse{

    self = [super init];
    if (self) {
        self.openCourseID = openCourse.openCourseID.integerValue;
    self.videoID = openCourse.videoID.integerValue;
    self.clickCount = openCourse.clickCount.integerValue;
    self.videoName = openCourse.videoName;
    self.videoUrl = openCourse.videoUrl;
    self.createTime = openCourse.createTime;
    self.authorName = openCourse.authorName;
    self.pictureUrl = openCourse.pictureUrl;
    }
    return  self;
}
//一批CoreData对象转成对象数组
+ (NSArray *)arrayOfOpenCourseFromManagedObjArray:(NSArray *)objs{

    NSMutableArray *mArray = [NSMutableArray array];
    for (OpenCourse *openCourseObj in objs) {
        HYHOpenCourse *openCourse = [[self alloc]initManagedObj:openCourseObj];
        [mArray addObject:openCourseObj];
    }
    return mArray;
}



@end
