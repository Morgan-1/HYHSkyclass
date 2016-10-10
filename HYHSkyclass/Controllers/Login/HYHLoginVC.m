//
//  HYHLoginVC.m
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/8.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import "HYHLoginVC.h"
#import "HYHAppFlow.h"
#import "HYHLoginManager.h"
#import "NSString+HYHUtils.h"
#import "AFNetWorkReachabilityManager.h"
#import "MBProgressHUD+HYHMB.h"

@interface HYHLoginVC ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@end

@implementation HYHLoginVC
- (IBAction)login:(id)sender {
    if (self.userName.text.length && self.password.text.length) {
        BOOL networkReachable = [AFNetworkReachabilityManager sharedManager];
        if (networkReachable) {
            [MBProgressHUD showMessage:@"登录中....." toView:self.view];
            __weak typeof (self) weakSelf = self;
            [[HYHLoginManager manager] loginWithUserName:self.userName.text encyptedPassword:self.password.text success:^(BOOL status) {
                [MBProgressHUD hideHUDForView:weakSelf.view];
                if (status) {
                    NSLog(@"登录成功");
                    [MBProgressHUD showSuccess:@"登录成功"];
                    [HYHAppFlow showMainViewController];
                }else{
                
                    [MBProgressHUD showError:@"用户名或密码错误"];
                    [weakSelf clearText];
                }
            } failure:^(NSError *error) {
                [MBProgressHUD hideHUDForView:weakSelf.view];
                [MBProgressHUD showError:@"登录错误"];
                [weakSelf clearText];
                NSLog(@"network error :%@",error);
                
            }];
            
        }else{
        
            [MBProgressHUD showError:@"请开启网络"];
        }
    }
    else{
        [MBProgressHUD showError:@"用户名或密码不能为空"];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bgImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backgroundClick)];
    [self.bgImageView addGestureRecognizer:tapGesture];
}

- (void)backgroundClick{

    [self.userName resignFirstResponder];
    [self.password resignFirstResponder];
}

- (void)clearText{

    self.userName.text = nil;
    self.password.text = nil;
}


- (void)showAlertMessage:(NSString *)message{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示信息" message:message delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}
@end
