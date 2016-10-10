//
//  NSString+HYHUtils.h
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/10.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HYHUtils)

- (NSString *)trim;
- (NSString *)md5;

- (NSString *)relativePath;

@end

@interface NSString (HYHFormat)

+ (NSString *)formattedTimeStringFromSeconds:(NSInteger)seconds;

@end
