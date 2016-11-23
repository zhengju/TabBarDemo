
#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"



#import <UIKit/UIKit.h>
@class ZJTabBarController;

static ZJTabBarController * tabar = nil;

@interface ZJTabBarController : UITabBarController

@property (nonatomic,strong) NSArray *childItemsArray;
/**
 默认选中的按钮（默认选中第一个按钮），0~n以次增加
 */
@property(nonatomic)NSInteger defaultSelectedIndex;

+ (instancetype )shareTabar;

#pragma mark 添所有的加子控制器
-(void)setUPAllChildViewController;




- (void)reSetup;

@end
