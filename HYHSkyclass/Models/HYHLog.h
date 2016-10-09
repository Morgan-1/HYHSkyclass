//
//  HYHLog.h
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/8.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Log;
@interface HYHLog : NSObject

@property (nullable, nonatomic, copy) NSString *paltformCode;

@property (nullable, nonatomic, copy) NSString *operationCode;

@property (nullable, nonatomic, copy) NSString *beginTime;

@property (nullable, nonatomic, copy) NSString *studentCode;

@property (nullable, nonatomic, copy) NSString *courseCode;

@property (nullable, nonatomic, copy) NSString *duration;

@property (nullable, nonatomic, copy) NSString *videoName;

- (NSString *)toUrlParamString;

- (instancetype)initManagedObj:(Log *)log;

+ (NSArray *)arrayOfLogFromManagedObjArray:(NSArray *)objs;

- (NSString *)description;


@end
