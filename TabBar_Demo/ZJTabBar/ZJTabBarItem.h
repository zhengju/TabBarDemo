//
//  ZJTabBarItem.h
//  TabBar_Demo
//
//  Created by zhengju on 2017/9/8.
//  Copyright © 2017年 zhengju. All rights reserved.
//控制按钮显示情况

#import <UIKit/UIKit.h>

@interface ZJTabBarItem : UITabBarItem
/**
 未选中字体颜色
 */
@property(strong,nonatomic) UIColor * itemNomalColor;
/**
 选中颜色
 */
@property(strong,nonatomic) UIColor * itemSelectedColor;
/**
 字体显示大小,默认字体大小为 14
 */
@property(nonatomic,strong) UIFont * font;
@end
