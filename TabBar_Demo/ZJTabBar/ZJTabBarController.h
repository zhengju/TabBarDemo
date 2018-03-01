
#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"


#import <UIKit/UIKit.h>

@protocol ZJTabBarControllerProtocol<NSObject>

@required
#pragma mark 添所有的加子控制器
- (void)setUPAllChildViewController;
@optional
#pragma mark 重置
- (void)reSetup;
#pragma 选择按钮成功
- (void)tabBarSelectedBtnSuccess:(int)to;
#pragma mark 拦截跳转，子类实现，就走方法
- (void)tabBarDidselectedButtonFrom:(int)from to:(int)to block:(void(^)())success_block;

@end


@class ZJTabBarController;

static ZJTabBarController * tabar = nil;

@interface ZJTabBarController : UITabBarController<ZJTabBarControllerProtocol>

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
/**
 做单独的按钮，显示在中间位置 ，两边程对称趋势,此属性必须写在
 [super viewDidLoad];之前，因为要提前赋值
 */
@property(assign,nonatomic) int  separateBtnIndex;

/**
 单独处理按钮index，点击之后特殊处理，例如：弹出登录界面
 */
@property(assign,nonatomic) int  interceptIndex;

/**
 单独的按钮是否超出tabBar
 */
@property(assign,nonatomic) BOOL  isSeparateBtnHit;

/**
 是否切换主题，默认是NO
 */
@property(assign,nonatomic) BOOL  isSwitchingTheme;

/**
 控制器数组
 */
@property (nonatomic,strong) NSArray *childItemsArray;
/**
 默认选中的按钮（默认选中第一个按钮），0~n以次增加
 */
@property(nonatomic)NSInteger defaultSelectedIndex;

+ (instancetype )shareTabar;

@end
