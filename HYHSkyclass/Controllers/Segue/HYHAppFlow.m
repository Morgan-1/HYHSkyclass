//
//  HYHAppFlow.m
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/8.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import "HYHAppFlow.h"
#import "HYHLoginVC.h"
#import "HYHRootViewController.h"
@implementation HYHAppFlow
//显示main页面
+ (void)showMainViewController
{

    HYHRootViewController *rootVC = [[HYHRootViewController alloc]init];
    [[UIApplication sharedApplication].delegate window].rootViewController = rootVC;
}
//显示登录页面
+ (void)showLoginViewController
{

    HYHLoginVC *loginVC = [[UIStoryboard storyboardWithName:@"Login" bundle:nil]instantiateViewControllerWithIdentifier:@"login"];
    [[UIApplication sharedApplication].delegate window].rootViewController = loginVC;
}
@end
