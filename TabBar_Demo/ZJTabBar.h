
 
#import <UIKit/UIKit.h>
@class ZJTabBar;
@class ZJTabBarButton;

@protocol ZJTabBarDetagate <NSObject>
@optional
-(void)tabBar:(ZJTabBar *)tabBar didselectedButtonFrom:(int )from to: (int )to;
@end

@protocol ZJTabBarLoginDetagate <NSObject>

- (void)login;

@end
@interface ZJTabBar : UIView
@property(nonatomic,weak)id<ZJTabBarDetagate>delegate;
@property(nonatomic,weak)id<ZJTabBarLoginDetagate>loginDelegate;
-(void)addTabBarButtonWithItem:(UITabBarItem *)item;
+(id)shareTabBar;
-(void)buttonClick:(ZJTabBarButton *)button;
@property(nonatomic,strong)NSMutableArray *tabBarButtons;
- (void)selectAtIndex:(NSInteger)index;


@end


