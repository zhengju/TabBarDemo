//
//  MyTabBarController.m
//  TabBar_Demo
//
//  Created by zhengju on 16/11/18.
//  Copyright © 2016年 zhengju. All rights reserved.
//

#import "MyTabBarController.h"

#import "ZJNavigationController.h"



@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)setUPAllChildViewController{

    self.childItemsArray = @[
                                 @{kClassKey  : @"HomeController",
                                   kTitleKey  : @"首页",
                                   kImgKey    : @"shouyexuanzhong",
                                   kSelImgKey : @"shouye"},
                                 
                                 @{kClassKey  : @"ServiceController",
                                   kTitleKey  : @"服务",
                                   kImgKey    : @"fuwu",
                                   kSelImgKey : @"fuwuxuanzhong"},
                                 
                                 @{kClassKey  : @"MeController",
                                   kTitleKey  : @"我的",
                                   kImgKey    : @"wode",
                                   kSelImgKey : @"wodexuanzhong"},
                                 ];
    
    [super setUPAllChildViewController];

}

@end
