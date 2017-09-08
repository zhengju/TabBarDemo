
#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"

#import <UIKit/UIKit.h>
@class ZJTabBarController;

static ZJTabBarController * tabar = nil;

@interface ZJTabBarController : UITabBarController



//地航栏按钮设置
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

/**
 是否做拦截
 */
@property(assign,nonatomic) BOOL  isIntercept;


@property (nonatomic,strong) NSArray *childItemsArray;
/**
 默认选中的按钮（默认选中第一个按钮），0~n以次增加
 */
@property(nonatomic)NSInteger defaultSelectedIndex;

+ (instancetype )shareTabar;

#pragma mark 添所有的加子控制器
- (void)setUPAllChildViewController;
#pragma mark 拦截跳转，子类实现，就走方法
- (void)tabBarDidselectedButtonFrom:(int)from to:(int)to block:(void(^)())success_block;
- (void) interceptIndex:(int)index setSuccessBlock:(void(^)())success_block;
#pragma mark 重置
- (void)reSetup;
#pragma 选择按钮成功
- (void)tabBarSelectedBtnSuccess:(int)to;
- (void)tabBarSelectedBtnSuccess;

@end
