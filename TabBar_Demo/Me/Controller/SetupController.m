//
//  SetupController.m
//  TabBar_Demo
//
//  Created by zhengju on 16/11/9.
//  Copyright © 2016年 zhengju. All rights reserved.
//

#import "SetupController.h"

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


@end
