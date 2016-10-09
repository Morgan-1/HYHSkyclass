//
//  HYHLog.m
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/8.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import "HYHLog.h"
#import <objc/runtime.h>
#import "Log+CoreDataClass.h"
@implementation HYHLog


- (NSString *)toUrlParamString{
    NSString *paramString = [NSString stringWithFormat:@"p=%@&o=%@&t=%@&s=%@&c=%@&l=%@&i=%@",
                             self.paltformCode,
                             self.operationCode,
                             self.beginTime,
                             self.studentCode,
                             self.courseCode,
                             self.duration,
                             self.videoName
                             ];
    
    return paramString;
}

- (instancetype)initManagedObj:(Log *)log{
    self = [super init];
    if(self){
        self.paltformCode = log.paltformCode;
        self.operationCode = log.operationCode;
        self.beginTime = log.beginTime;
        self.studentCode = log.studentCode;
        self.courseCode = log.courseCode;
        self.duration = log.duration;
        self.videoName = log.videoName;
    }
    return self;
}

+ (NSArray *)arrayOfLogFromManagedObjArray:(NSArray *)objs{
    NSMutableArray *mArray = [NSMutableArray array];
    for(Log *logObj in objs){
        HYHLog *log = [[self alloc] initManagedObj:logObj];
        [mArray addObject:log];
    }
    return mArray;
}

- (NSString *)description{
    NSString *str = @"";
    
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList(self.class, &count);
    for(int i = 0 ; i < count; i++){
        Ivar ivar = ivars[i];
        
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        ivarName = [ivarName substringFromIndex:1];
        
        id value = object_getIvar(self, ivar);
        
        str = [NSString stringWithFormat:@"%@, %@ : %@", str, ivarName, value];
    }
    
    return str;
}



@end
