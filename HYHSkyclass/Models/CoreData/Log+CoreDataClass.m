//
//  Log+CoreDataClass.m
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import "Log+CoreDataClass.h"
#import "HYHLog.h"
@implementation Log

- (void)setDataWithLogModel:(HYHLog *)log{

    self.paltformCode = log.paltformCode;
    self.operationCode = log.operationCode;
    self.beginTime = log.beginTime;
    self.studentCode = log.studentCode;
    self.courseCode = log.courseCode;
    self.duration = log.duration;
    self.videoName = log.videoName;

}
@end
