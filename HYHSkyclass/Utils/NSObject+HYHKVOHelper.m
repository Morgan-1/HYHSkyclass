//
//  NSObject+HYHKVOHelper.m
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/8.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import "NSObject+HYHKVOHelper.h"

@implementation NSObject (HYHKVOHelper)

- (void)registerKVO{

    for (NSString *keyPath in [self observableKeyPaths]) {
        [self addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:NULL];
    }
}

- (void)unregiSterKVO{

    for (NSString *keyPath in [self observableKeyPaths]) {
        [self removeObserver:self forKeyPath:keyPath];
    }
}

- (NSArray *)observableKeyPaths{

    return @[];
}
@end
