//
//  OpenCourse+CoreDataClass.m
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import "OpenCourse+CoreDataClass.h"
#import "HYHOpenCourse.h"
@implementation OpenCourse
- (void)setDataWithOpenCourseModel:(HYHOpenCourse *)openCourse{
    self.openCourseID = [NSNumber numberWithInteger:openCourse.openCourseID];
    self.videoID = [NSNumber numberWithInteger:openCourse.videoID];
    self.clickCount = [NSNumber numberWithInteger:openCourse.clickCount];
    self.authorName = openCourse.authorName;
    self.createTime = openCourse.createTime;
    self.videoName = openCourse.videoName;
    self.videoUrl = openCourse.videoUrl;
    self.pictureUrl = openCourse.pictureUrl;
    self.isWatched = [NSNumber numberWithBool:openCourse.isWatched];
}
@end
