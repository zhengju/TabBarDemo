//
//  MeController.m
//  TabBar_Demo
//
//  Created by zhengju on 16/11/8.
//  Copyright © 2016年 zhengju. All rights reserved.
//

#import "MeController.h"
#import "SetupController.h"
@interface MeController ()

@end

@implementation MeController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.title = @"我的";
    self.backBtn.hidden = YES;
}
- (IBAction)setUpClick:(UIButton *)sender {
    SetupController * setupController = [[SetupController alloc]init];
    
    [self.navigationController pushViewController:setupController animated:YES];
    
}

@end
