//
//  HYHLive.h
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/8.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYHLive : NSObject

@property(nonatomic, copy) NSString *classid;

@property(nonatomic, copy) NSString *classname;

@property(nonatomic, copy) NSString *teachername;

@property(nonatomic, copy) NSString *videopath;

@property(nonatomic, copy) NSString *screenpath;

@property(nonatomic, copy) NSString *starttime;

@property(nonatomic, copy) NSString *serverpath;

@property(nonatomic, copy) NSString *location;

@property(nonatomic, copy) NSString *temp_time;

+ (UIImage *)getThumbnailImage:(HYHLive *)liveModel;


@end
