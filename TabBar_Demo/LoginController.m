//
//  LoginController.m
//  TabBar_Demo
//
//  Created by zhengju on 16/11/9.
//  Copyright © 2016年 zhengju. All rights reserved.
//

#import "LoginController.h"

#import "MyTabBarController.h"

@interface LoginController ()

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"登录";
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)loginBtn:(UIButton *)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
        MyTabBarController * tabBarController = [MyTabBarController shareTabar];
        tabBarController.defaultSelectedIndex = 2;
        
    }];
    
}

@end
