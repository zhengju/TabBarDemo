//
//  ServiceController.m
//  TabBar_Demo
//
//  Created by zhengju on 16/11/8.
//  Copyright © 2016年 zhengju. All rights reserved.
//

#import "ServiceController.h"

#import "LoginController.h"
#import "ZJNavigationController.h"

@interface ServiceController ()

@end

@implementation ServiceController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"购物车";
}

- (IBAction)loginClick:(UIButton *)sender {
    ZJNavigationController * nvc = [[ZJNavigationController alloc]initWithRootViewController:[[LoginController alloc]init]];
    
    [self.navigationController presentViewController:nvc animated:YES completion:^{
        
    }];
}



@end
