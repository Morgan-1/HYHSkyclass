//
//  Log+CoreDataClass.h
//  
//
//  Created by yunhuihuang on 2016/10/8.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN
@class HYHLog;
@interface Log : NSManagedObject
- (void)setDataWithLogModel:(HYHLog *)log;
@end

NS_ASSUME_NONNULL_END

#import "Log+CoreDataProperties.h"
