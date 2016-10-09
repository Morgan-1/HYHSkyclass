//
//  HYHCourseItem.h
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/8.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CourseItem;
@interface HYHCourseItem : NSObject

@property(nonatomic, assign) NSInteger cid;

@property(nonatomic, assign) NSInteger itemID;

@property(nonatomic, assign) NSInteger sectionID;

@property(nonatomic, copy) NSString *itemName;

@property(nonatomic, copy) NSString *svPath;

@property(nonatomic, copy) NSString *svPicPath;

@property(nonatomic, copy) NSString *tvPath;

@property(nonatomic, copy) NSString *tvPicPath;

@property(nonatomic, copy) NSString *ttime;

@property(nonatomic, assign) BOOL isWatched;

@property(nonatomic, assign) BOOL isSelected;

- (instancetype)initWithDict:(NSDictionary *)dict;

- (instancetype)initWithManagedObj:(CourseItem *)courseItemObj;

+ (NSArray *)arrayOfCourseItemFromManagedObjArray:(NSArray *)objs;


@end
