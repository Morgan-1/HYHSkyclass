//
//  UIBarButtonItem+HYHExtension.h
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/8.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (HYHExtension)
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName target:(id)target action:(SEL)action;

@end
