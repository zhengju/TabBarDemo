
 
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
 添加按钮元素

 @param item UITabBarItem ，携带配置信息
 */

-(void)addTabBarButtonWithItem:(ZJTabBarItem *)item;

- (void)selectedSuccess;

@end


