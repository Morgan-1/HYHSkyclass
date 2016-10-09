//
//  HYHRootViewController.m
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/8.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import "HYHRootViewController.h"
#import "RDVTabBarItem.h"
#import "HYHNewsTableVC.h"
#import "HYHOpenCourseTableVC.h"
#import "HYHDemandCollectionVC.h"

#import "HYHNavigationController.h"
@interface HYHRootViewController ()

@end

@implementation HYHRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.viewControllers = [self createViewControllers];
    self.tabBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background" ]];
    [self customizeTabbarItems];
    self.selectedIndex = 0;
}
//将创建的文件合成数组
- (NSArray *)createViewControllers{
    HYHOpenCourseTableVC *openCourseVC = [[HYHOpenCourseTableVC alloc]init];
    
    UICollectionViewLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    HYHDemandCollectionVC *demandLearningVC = [[HYHDemandCollectionVC alloc]initWithCollectionViewLayout:layout];
    
    HYHNewsTableVC *newTableVC = [[HYHNewsTableVC alloc]init];
    
    HYHNavigationController *openCourseNC = [[HYHNavigationController alloc]initWithRootViewController:openCourseVC];
    HYHNavigationController *demandLearningNC = [[HYHNavigationController alloc]initWithRootViewController:demandLearningVC];
    HYHNavigationController *newTablNC = [[HYHNavigationController alloc]initWithRootViewController:newTableVC];
    
    return @[openCourseNC,demandLearningNC,newTablNC];
    
}
//初始化TabBar
- (void)customizeTabbarItems{

    // 没有选中时的字体
    NSDictionary *unselectedTitleAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:12.f]};
    //选中时的字体
    NSDictionary *selectedTitleAttributes = @{NSForegroundColorAttributeName:rgb(253, 115, 0),NSFontAttributeName:[UIFont systemFontOfSize:12.f]};
    //图片的位置
    UIOffset imagePositionAdjustment = UIOffsetMake(0.f, -3.f);
    NSLog(@"%@",self.tabBar);
    
    RDVTabBarItem *itemOpenCourse = self.tabBar.items[0];
    itemOpenCourse.selectedTitleAttributes = selectedTitleAttributes;
    itemOpenCourse.unselectedTitleAttributes = unselectedTitleAttributes;
    itemOpenCourse.imagePositionAdjustment = imagePositionAdjustment;
    [itemOpenCourse setFinishedSelectedImage:[UIImage imageNamed:@"application_select"] withFinishedUnselectedImage:[UIImage imageNamed:@"application"]];  //tabBarItem 被选中和没有选中时的图片
    
    RDVTabBarItem *itemDemandLearning = self.tabBar.items[1];
    itemDemandLearning.selectedTitleAttributes = selectedTitleAttributes;
    itemDemandLearning.unselectedTitleAttributes = unselectedTitleAttributes;
    itemDemandLearning.imagePositionAdjustment = imagePositionAdjustment;
    [itemDemandLearning setFinishedSelectedImage:[UIImage imageNamed:@"forum_selected_icon"] withFinishedUnselectedImage:[UIImage imageNamed:@"forum_icon"]];
    
    RDVTabBarItem *itemNews = self.tabBar.items[2];
    itemNews.selectedTitleAttributes = selectedTitleAttributes;
    itemNews.unselectedTitleAttributes = unselectedTitleAttributes;
    itemNews.imagePositionAdjustment = imagePositionAdjustment;
    [itemNews setFinishedSelectedImage:[UIImage imageNamed:@"forum_selected_icon"] withFinishedUnselectedImage:[UIImage imageNamed:@"forum_icon"]];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
