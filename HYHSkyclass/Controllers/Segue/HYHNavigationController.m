//
//  HYHNavigationController.m
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/8.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import "HYHNavigationController.h"
#import "UIBarButtonItem+HYHExtension.h"
@interface HYHNavigationController ()

@end

@implementation HYHNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (void)initialize{

    
}
//设置顶部导航栏中间的标题样式
+ (void)setupNavigationBarTheme{

    UINavigationBar *appearance = [UINavigationBar appearance];
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowOffset = CGSizeZero;
    textAttrs[NSShadowAttributeName] = shadow;
    [appearance setTitleTextAttributes:textAttrs];
}
//设置顶部导航栏左右两边的按钮的样式

+ (void)setupNavigationButtonItemTheme{

    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [appearance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    NSMutableDictionary *highTextAttrs = [NSMutableDictionary dictionary];
    highTextAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [appearance setTitleTextAttributes:highTextAttrs forState:UIControlStateDisabled];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{

    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_back" highlightedImageName:@"navigationbar_back_highlighted" target:self action:@selector(back)];
        
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_more" highlightedImageName:@"navigationbar_more_highlighted" target:self action:@selector(more)];
    }
    [super pushViewController:viewController animated:animated];
}
- (void)back{

    [self popViewControllerAnimated:YES];
}

- (void)more{

    [self popToRootViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
