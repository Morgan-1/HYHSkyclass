//
//  HYHOpenCourseTableVC.m
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/8.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import "HYHOpenCourseTableVC.h"
#import "XRCarouselView.h"
#import "HYHOpenCourseCell.h"
#import "MJRefresh.h"
#import "HYHOpenCourseManager.h"
#import "MBProgressHUD+HYHMB.h"
#import "WMPlayer.h"
#import "HYHOpenCourse.h"
#import "UITableView+FDTemplateLayoutCell.h"

static NSString *openCourseIdentifier = @"openCourseIdentifier";

@interface HYHOpenCourseTableVC () <UITableViewDelegate, UITableViewDataSource,XRCarouselViewDelegate,WMPlayerDelegate>{

    WMPlayer *wmPlayer;
}
@property(nonatomic, strong) XRCarouselView *headerView;

@property(nonatomic, strong) NSMutableArray *dataSource;

@property(nonatomic, assign) NSInteger headerPageCount;

@property(nonatomic, assign) BOOL isLoaded;

@end

@implementation HYHOpenCourseTableVC
- (BOOL)prefersStatusBarHidden{

    return YES;
}
- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onDeviceOrientationChangeNew) name:UIDeviceOrientationDidChangeNotification object:nil];
}
- (void)onDeviceOrientationChangeNew{
    
    if (wmPlayer == nil || wmPlayer.superview == nil) {
        return;
    }
    UIDeviceOrientation orientaiton = [UIDevice currentDevice].orientation;
    UIInterfaceOrientation interfaceOrientation = (UIInterfaceOrientation)orientaiton;
    switch (interfaceOrientation) {
        case UIInterfaceOrientationLandscapeLeft:
            // [self setNeedsStatusBarAppearanceUpdate];
            [self toFullScreenWithInterfaceOrientation:UIInterfaceOrientationLandscapeLeft];
            
            break;
        case UIInterfaceOrientationLandscapeRight:
            // [self setNeedsStatusBarAppearanceUpdate];
            [self toFullScreenWithInterfaceOrientation:UIInterfaceOrientationLandscapeRight];
        default:
            break;
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    self.navigationItem.title = @"公开课";
    
    self.isLoaded = NO;
    self.headerPageCount = 4;
    [self configureViews];
    [self.tableView.mj_header beginRefreshing];
}
- (void)configureViews{

    [self.tableView registerClass:[HYHOpenCourseCell class] forCellReuseIdentifier:openCourseIdentifier];
    self.tableView.tableHeaderView = self.headerView;
    //下拉刷新
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    header.stateLabel.font = [UIFont systemFontOfSize:13];
    self.tableView.mj_header = header;
}
- (XRCarouselView *)headerView{

    if (!_headerView) {
        if (self.headerPageCount) {
            _headerView = [[XRCarouselView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 170+10)];
            _headerView.time = 2.0;
            _headerView.pagePosition = PositionBottomRight;
            _headerView.delegate = self;
        }
    }
    return _headerView;
}

-(void)setDataSource:(NSMutableArray *)dataSource{

    _dataSource = dataSource;
    NSMutableArray *urlArray = [NSMutableArray array];
    NSMutableArray *descArray = [NSMutableArray array];
    if (dataSource.count > self.headerPageCount) {
        NSArray *subArr = [dataSource subarrayWithRange:NSMakeRange(0, self.headerPageCount)];
        for (int i = 0; i < self.headerPageCount; i++) {
            HYHOpenCourse *openCourse = [[HYHOpenCourse alloc]init];
            openCourse = subArr[i];
            [urlArray addObject:openCourse.pictureUrl];
            [descArray addObject:openCourse.videoName];
        }
        self.headerView.imageArray = urlArray;
        self.headerView.describeArray = descArray;
    }else{
     
        for (int i = 0; i < self.dataSource.count; i++) {
            HYHOpenCourse *openCourse = [[HYHOpenCourse alloc]init];
            openCourse = self.dataSource[i];
            [urlArray addObject:openCourse.pictureUrl];
            [descArray addObject:openCourse.videoName];
        }
        self.headerView.imageArray = urlArray;
        self.headerView.describeArray = descArray;
    }
    
}

#pragma mark - XRCarouselViewDelegate

- (void)carouselView:(XRCarouselView *)carouselView clickImageAtIndex:(NSInteger)index{

    HYHOpenCourse *openCourse = self.dataSource[index];
    [self playVideo:openCourse];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor colorWithWhite:0.933 alpha:1.000];
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    if ((self.dataSource.count - self.headerPageCount) > 0) {
        return self.dataSource.count - self.headerPageCount;
    }else{
    
        return  0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    HYHOpenCourseCell * cell = [tableView dequeueReusableCellWithIdentifier:openCourseIdentifier];
    if (!cell) {
        cell = [[HYHOpenCourseCell alloc]initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:openCourseIdentifier];
    }
    if ((self.dataSource.count - self.headerPageCount ) > 0) {
        HYHOpenCourse *openCourse = self.dataSource[indexPath.row + self.headerPageCount];
        cell.backgroundColor = self.tableView.backgroundColor;
        cell.selectionStyle = UITableViewCellSeparatorStyleNone;
        cell.openCourse = openCourse;
    }
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return [tableView fd_heightForCellWithIdentifier:openCourseIdentifier configuration:^(HYHOpenCourseCell *cell) {
        if (_dataSource.count - _headerPageCount > 0) {
            HYHOpenCourse *openCourse = _dataSource[indexPath.row + _headerPageCount];
            cell.openCourse = openCourse;
        }
    }] ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [self playVideo:self.dataSource[indexPath.row + self.headerPageCount]];
}

#pragma mark - play video

- (void)playVideo:(HYHOpenCourse *)openCourse{

    
    NSLog(@"ready to 播放视频");
    if (wmPlayer) {
        [self releaseWMPlayer];
        
        //        [wmPlayer play];
    }
    wmPlayer = [[WMPlayer alloc]initWithFrame:self.view.bounds];
    wmPlayer.delegate = self;
    wmPlayer.closeBtnStyle = CloseBtnStyleClose;
    wmPlayer.URLString = openCourse.videoUrl;
    wmPlayer.titleLabel.text = openCourse.videoName;
    //    [self.view addSubview:wmPlayer];
    [self.view bringSubviewToFront:wmPlayer];
    [self toFullScreenWithInterfaceOrientation:UIInterfaceOrientationLandscapeLeft];
    [wmPlayer play];

}

#pragma mark 播放器
- (void)toFullScreenWithInterfaceOrientation:(UIInterfaceOrientation )interfaceOrientation{
    
    [wmPlayer removeFromSuperview];
    [self setNeedsStatusBarAppearanceUpdate];
    
    wmPlayer.transform = CGAffineTransformIdentity;
    if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        wmPlayer.transform = CGAffineTransformMakeRotation(-M_PI_2);
    }else if(interfaceOrientation == UIInterfaceOrientationLandscapeRight){
        
        wmPlayer.transform = CGAffineTransformMakeRotation(M_PI_2);
    }
    //重新设置frame
    wmPlayer.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    wmPlayer.playerLayer.frame = CGRectMake(0, 0, kScreenHeight, kScreenWidth);
    /*
     //更新约束
     [wmPlayer.bottomView  mas_remakeConstraints:^(MASConstraintMaker *make) {
     make.height.mas_equalTo(40);
     make.top.mas_equalTo(kScreenWidth -40);
     make.width.mas_equalTo(kScreenHeight);
     }];
     [wmPlayer.topView mas_remakeConstraints:^(MASConstraintMaker *make) {
     make.height.mas_equalTo(40);
     make.left.equalTo(wmPlayer).width.offset(0);
     make.width.mas_equalTo(kScreenHeight);
     
     }];
     [wmPlayer.closeBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
     make.right.equalTo(wmPlayer).width.offset((-kScreenHeight/2));
     make.height.mas_equalTo(30);
     make.width.mas_equalTo(30);
     make.top.equalTo(wmPlayer).with.offset(5);
     }];
     [wmPlayer.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
     make.left.equalTo(wmPlayer.topView).with.offset(45);
     make.right.equalTo(wmPlayer.topView).with.offset(-45);
     make.center.equalTo(wmPlayer.topView);
     make.top.equalTo(wmPlayer.topView).with.offset(0);
     }];
     [wmPlayer.loadFailedLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
     make.width.mas_equalTo(kScreenHeight);
     make.center.mas_equalTo(CGPointMake(kScreenWidth/2-36, -(kScreenWidth/2)));
     make.height.equalTo(@30);
     }];
     
     [wmPlayer.loadingView mas_remakeConstraints:^(MASConstraintMaker *make) {
     make.center.mas_equalTo(CGPointMake(kScreenWidth/2-37, -(kScreenWidth/2-37)));
     }];
     [wmPlayer.loadFailedLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
     make.width.mas_equalTo(kScreenHeight);
     make.center.mas_equalTo(CGPointMake(kScreenWidth/2-36, -(kScreenWidth/2)+36));
     make.height.equalTo(@30);
     }];
     */
    //更新约束，不是继续添加约束mas_remakeConstraint
    [wmPlayer.bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(kScreenWidth-40);
        make.width.mas_equalTo(kScreenHeight);
    }];
    
    [wmPlayer.topView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(40);
        make.left.equalTo(wmPlayer).with.offset(0);
        make.width.mas_equalTo(kScreenHeight);
    }];
    
    [wmPlayer.closeBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(wmPlayer).with.offset((-kScreenHeight/2));
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(30);
        make.top.equalTo(wmPlayer).with.offset(5);
        
    }];
    
    [wmPlayer.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(wmPlayer.topView).with.offset(45);
        make.right.equalTo(wmPlayer.topView).with.offset(-45);
        make.center.equalTo(wmPlayer.topView);
        make.top.equalTo(wmPlayer.topView).with.offset(0);
    }];
    
    [wmPlayer.loadFailedLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kScreenHeight);
        make.center.mas_equalTo(CGPointMake(kScreenWidth/2-36, -(kScreenWidth/2)));
        make.height.equalTo(@30);
    }];
    
    [wmPlayer.loadingView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(CGPointMake(kScreenWidth/2-37, -(kScreenWidth/2-37)));
    }];
    [wmPlayer.loadFailedLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kScreenHeight);
        make.center.mas_equalTo(CGPointMake(kScreenWidth/2-36, -(kScreenWidth/2)+36));
        make.height.equalTo(@30);
    }];
    [[UIApplication sharedApplication].keyWindow addSubview:wmPlayer];
    // [self.view addSubview:wmPlayer];
    wmPlayer.fullScreenBtn.hidden = YES;
    [wmPlayer bringSubviewToFront:wmPlayer.bottomView];
    
    
}

///播放器事件
-(void)wmplayer:(WMPlayer *)wmplayer clickedCloseButton:(UIButton *)closeBtn{
    NSLog(@"didClickedCloseButton");
    [self releaseWMPlayer];
    [self setNeedsStatusBarAppearanceUpdate];
    
}
-(void)wmplayer:(WMPlayer *)wmplayer singleTaped:(UITapGestureRecognizer *)singleTap{
    NSLog(@"didSingleTaped");
}
-(void)wmplayer:(WMPlayer *)wmplayer doubleTaped:(UITapGestureRecognizer *)doubleTap{
    NSLog(@"didDoubleTaped");
}

///播放状态
-(void)wmplayerFailedPlay:(WMPlayer *)wmplayer WMPlayerStatus:(WMPlayerState)state{
    NSLog(@"wmplayerDidFailedPlay");
}
-(void)wmplayerReadyToPlay:(WMPlayer *)wmplayer WMPlayerStatus:(WMPlayerState)state{
    NSLog(@"wmplayerDidReadyToPlay");
}
-(void)wmplayerFinishedPlay:(WMPlayer *)wmplayer{
    NSLog(@"wmplayerDidFinishedPlay");
    [self releaseWMPlayer];
    [self setNeedsStatusBarAppearanceUpdate];
}
/**
 *  释放WMPlayer
 */
-(void)releaseWMPlayer{
    //堵塞主线程
    //    [wmPlayer.player.currentItem cancelPendingSeeks];
    //    [wmPlayer.player.currentItem.asset cancelLoading];
    [wmPlayer pause];
    
    
    [wmPlayer removeFromSuperview];
    [wmPlayer.playerLayer removeFromSuperlayer];
    [wmPlayer.player replaceCurrentItemWithPlayerItem:nil];
    wmPlayer.player = nil;
    wmPlayer.currentItem = nil;
    //释放定时器，否侧不会调用WMPlayer中的dealloc方法
    [wmPlayer.autoDismissTimer invalidate];
    wmPlayer.autoDismissTimer = nil;
    
    
    wmPlayer.playOrPauseBtn = nil;
    wmPlayer.playerLayer = nil;
    wmPlayer = nil;
}
- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [self releaseWMPlayer];
}

#pragma mark - 进入刷新状态，更新数据
- (void)refreshData{
    
    HYHOpenCourseManager *manager = [HYHOpenCourseManager manager];
    __weak typeof(self) weakself = self;
    
    [manager fetchOpenCoursesWithCompleteBlock:^(NSArray *array) {
        weakself.dataSource = [array mutableCopy];
        [weakself.tableView reloadData];
        [weakself.tableView.mj_header  endRefreshing];
        weakself.isLoaded = YES;
    } andFailure:^(NSError *error) {
        [weakself.tableView.mj_header endRefreshing];
        [MBProgressHUD showError:@"网络错误"];
        
    } fromServer:self.isLoaded];
    NSLog(@"update opencourese data");
    
}

@end
