//
//  LoginController.h
//  TabBar_Demo
//
//  Created by zhengju on 16/11/9.
//  Copyright © 2016年 zhengju. All rights reserved.
//登陆界面

#import "SuperController.h"

@interface LoginController : SuperController
@property (nonatomic , copy) dispatch_block_t loginSuccessBlock;
@end
