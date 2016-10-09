//
//  HYHCourseInfo.h
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/8.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CourseInfo;
@interface HYHCourseInfo : NSObject

/**
 *  这个属性是course实际的ID，Course中的ID不是，但是Course中的ID又得用来请求其他数据，因而不能轻易修改，（给后台填坑）
 */
@property(nonatomic, assign) NSInteger cid;

@property(nonatomic, copy) NSString *courseCode;

@property(nonatomic, copy) NSString *CourseName;

// 其他还有许多可获取数据，留待以后扩展时候用

- (instancetype)initWithDict:(NSDictionary *)dict;

- (instancetype)initWithManagedObj:(CourseInfo *)courseInfoObj;


@end
