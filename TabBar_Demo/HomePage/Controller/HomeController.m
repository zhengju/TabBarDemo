//
//  HomeController.m
//  TabBar_Demo
//
//  Created by zhengju on 16/11/8.
//  Copyright © 2016年 zhengju. All rights reserved.
//

#import "HomeController.h"
#import "ZJTabBarController.h"
@interface HomeController ()

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    [[NSNotificationCenter defaultCenter]postNotificationName:BADGEVALUE object:nil userInfo:@{BADGEVALUE:@"1033",@"index":@(3)}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
