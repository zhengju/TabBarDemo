



#import <UIKit/UIKit.h>
#define ZJTabBarButtonImageRatio 0.6

@class ZJTabBarItem;
@interface ZJTabBarButton : UIButton
@property(nonatomic,strong)ZJTabBarItem *item;

@end

#import "ZJTabBarButton.h"
@interface ZJTabBarNormalBtn : ZJTabBarButton

@end

