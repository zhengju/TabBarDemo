



#import <UIKit/UIKit.h>
#define ZJTabBarButtonImageRatio 0.6

@class ZJTabBarItem;
@interface ZJTabBarButton : UIButton
@property(nonatomic,strong)ZJTabBarItem *item;
@property(copy,nonatomic) NSString * badgeValue;
@end

#import "ZJTabBarButton.h"
@interface ZJTabBarNormalBtn : ZJTabBarButton

@end

