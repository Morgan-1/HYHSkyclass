//
//  NSObject+HYHKVOHelper.h
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/8.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (HYHKVOHelper)
- (void)registerKVO;
- (void)unregiSterKVO;
- (NSArray *)observableKeyPaths;
@end
