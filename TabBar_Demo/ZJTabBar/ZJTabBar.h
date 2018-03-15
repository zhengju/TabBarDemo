
 
#import <UIKit/UIKit.h>
@class ZJTabBar;
@class ZJTabBarItem;
@protocol ZJTabBarDetagate <NSObject>
@optional
-(void)tabBar:(ZJTabBar *)tabBar didselectedButtonFrom:(int )from to: (int )to;
@end

@interface ZJTabBar : UIView
@property(nonatomic,weak)id<ZJTabBarDetagate>delegate;

/**
 生成单例对象
 
 @return 返回单例
 */
+(id)shareTabBar;

/**
 被选中的按钮的位置
 */
@property(nonatomic)NSInteger selectedIndex;
/**
 做单独的按钮，显示在中间位置 ，两边程对称趋势
 */
@property(assign,nonatomic) int  separateBtnIndex;
/**
 单独的按钮是否超出tabBar
 */
@property(assign,nonatomic) BOOL  isSeparateBtnHit;
/**
 添加按钮元素

 @param item UITabBarItem ，携带配置信息
 */

-(void)addTabBarButtonWithItem:(ZJTabBarItem *)item;

/**
 切换按钮元素

 @param item UITabBarItem ，携带配置信息
 @param index 按钮位置信息
 */
-(void)switchTabBarButtonWithItem:(ZJTabBarItem *)item atIndex:(NSInteger)index;

/**
 按钮设置角标

 @param item UITabBarItem ，携带配置信息
 @param index 按钮位置信息
 */
-(void)badgeValueTabBarButtonWithItem:(ZJTabBarItem *)item atIndex:(NSInteger)index;

- (void)selectedSuccess;

@end


