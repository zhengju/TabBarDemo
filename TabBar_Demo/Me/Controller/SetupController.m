//
//  SetupController.m
//  TabBar_Demo
//
//  Created by zhengju on 16/11/9.
//  Copyright © 2016年 zhengju. All rights reserved.
//

#import "SetupController.h"
#import "ZJTabBarController.h"
@interface SetupController ()

@end

@implementation SetupController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
}

- (IBAction)logoutClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (IBAction)normalItemClick:(UIButton *)sender {
  
    [[NSNotificationCenter defaultCenter]postNotificationName:SWITCHINGTHEME object:nil userInfo:@{@"item":@"normal"}];
}

- (IBAction)redItemClick:(UIButton *)sender {
  
     [[NSNotificationCenter defaultCenter]postNotificationName:SWITCHINGTHEME object:nil userInfo:@{@"item":@"red"}];
}

@end
