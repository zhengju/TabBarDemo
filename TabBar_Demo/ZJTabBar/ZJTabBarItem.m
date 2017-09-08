//
//  ZJTabBarItem.m
//  TabBar_Demo
//
//  Created by zhengju on 2017/9/8.
//  Copyright © 2017年 郑俱. All rights reserved.
//

#import "ZJTabBarItem.h"

@implementation ZJTabBarItem

- (void)setFont:(UIFont *)font{
    _font = font;
    if (_font == nil) {
        _font = [UIFont systemFontOfSize:14];
    }
}
@end
