//
//  MyTabBarController.m
//  TabBar_Demo
//
//  Created by zhengju on 16/11/18.
//  Copyright © 2016年 zhengju. All rights reserved.
//

#import "MyTabBarController.h"
#import "LoginController.h"
#import "ZJNavigationController.h"

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isIntercept = YES;
   
    self.defaultSelectedIndex = 1;
    
}
-(void)setUPAllChildViewController{

    self.childItemsArray = @[
                                 @{kClassKey  : @"HomeController",
                                   kTitleKey  : @"首页",
                                   kImgKey    : @"shouyexuanzhong",
                                   kSelImgKey : @"shouye"},
                                 
                                 @{kClassKey  : @"ServiceController",
                                   kTitleKey  : @"购物车",
                                   kImgKey    : @"fuwu",
                                   kSelImgKey : @"fuwuxuanzhong"},
                                 
                                 @{kClassKey  : @"MeController",
                                   kTitleKey  : @"我的",
                                   kImgKey    : @"wode",
                                   kSelImgKey : @"wodexuanzhong"},
                                 ];
    
    
    
    
    self.itemNomalColor = RGBACOLOR(102, 102, 102, 1.0);
    
    self.itemSelectedColor =  RGBACOLOR(63, 101, 186, 1.0);

    
    
    [super setUPAllChildViewController];

}
- (void)tabBarDidselectedButtonFrom:(int)from to:(int)to block:(void (^)())success_block{
    

    [self interceptIndex:1 setSuccessBlock:^{
      
        
            LoginController * controller = [[LoginController alloc]init];
            ZJNavigationController * nav = [[ZJNavigationController alloc]initWithRootViewController:controller];;
            
          
            controller.loginSuccessBlock = ^(){//登录ok的回调
                
                [self tabBarSelectedBtnSuccess:to];
            };
            
            [self presentViewController:nav animated:YES completion:nil];
//        }else{
//            success_block();//封装
//        }
    }];
}
@end
