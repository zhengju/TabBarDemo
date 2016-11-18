
#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"

#import <UIKit/UIKit.h>
@class ZJTabBarController;

static ZJTabBarController * tabar = nil;

@interface ZJTabBarController : UITabBarController

@property (nonatomic,strong) NSArray *childItemsArray;

#pragma mark 添所有的加子控制器
-(void)setUPAllChildViewController;

-(void)didselectedButtonFrom:(int)from to:(int)to;

+ (instancetype )shareTabar;

- (void)reSetup;

@end
