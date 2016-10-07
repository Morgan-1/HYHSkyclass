//
//  AppDelegate.h
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/7.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

