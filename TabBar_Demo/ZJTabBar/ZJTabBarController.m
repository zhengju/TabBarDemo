

#import "ZJTabBarController.h"

#import "ZJNavigationController.h"
#import <objc/message.h>
#import "ZJTabBar.h"
#import "ZJTabBarItem.h"
#import "ZJTabBarButton.h"

@interface ZJTabBarController ()<ZJTabBarDetagate>
{
    int _toIndex;
}


@property(nonatomic,weak)ZJTabBar *customTabBar;
@end

@implementation ZJTabBarController
- (void)setIsIntercept:(BOOL)isIntercept{
    _isIntercept = isIntercept;
}
- (void)setSeparateBtnIndex:(int)separateBtnIndex{
    _separateBtnIndex = separateBtnIndex;
    
}
- (void)setIsSeparateBtnHit:(BOOL)isSeparateBtnHit{
    _isSeparateBtnHit = isSeparateBtnHit;
    
}
+ (void)initialize{

    [super initialize];
    
    UITabBar * tabBar = [UITabBar appearance];

    tabBar.backgroundImage = [UIImage imageNamed:@"tabella-beijing"];
    
    tabBar.backgroundColor = [UIColor whiteColor];
  
}
+ (instancetype )shareTabar{
    if (!tabar) {
        static dispatch_once_t predicate;
        dispatch_once(&predicate, ^{
            
            tabar = [[self alloc]init];
            
        });
    }
    return tabar;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化tabBar
    [self setupTabBar];
    //添加自控制器
    [self setUPAllChildViewController];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    for(UIView *child in self.tabBar.subviews){
        
        if([child isKindOfClass:[UIControl class]]){
            
            [child removeFromSuperview];//移除自带的tabBar
            
        }
        
    }
    
}
-(BOOL)shouldAutorotate{
    return NO;
}
/**完美解决tabBar重叠问题*/
-(void)viewWillLayoutSubviews{
    
    [super viewWillLayoutSubviews];
    
    for (UIView *child in self.tabBar.subviews) {
        
        if ([child isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            [child removeFromSuperview];
        }
    }
}


//初始化tabBar
-(void)setupTabBar{
    
    ZJTabBar *customTabBar=[ZJTabBar shareTabBar];

    customTabBar.frame=self.tabBar.frame;
  
    self.customTabBar=customTabBar;
    
    self.customTabBar.separateBtnIndex = _separateBtnIndex;
    self.customTabBar.isSeparateBtnHit = self.isSeparateBtnHit;
    customTabBar.delegate=self;
    
    [self.view addSubview:customTabBar];
    
}

/**
 设置选中的按钮
 
 @param defaultSelectedIndex 选中按钮的位置
 */
- (void)setDefaultSelectedIndex:(NSInteger)defaultSelectedIndex{
    _defaultSelectedIndex = defaultSelectedIndex;
    self.customTabBar.selectedIndex = _defaultSelectedIndex;
    
}

- (void)interceptIndex:(int)index setSuccessBlock:(void(^)())success_block{
    
    if (_toIndex == index) {//弹出登录界面
        success_block();
        
    }else{
        
        [self tabBarSelectedBtnSuccess:_toIndex];
    }
}

//监听按的改变
- (void)tabBar:(ZJTabBar *)tabBar didselectedButtonFrom:(int)from to:(int)to{
    
    if ([self respondsToSelector:@selector(tabBarDidselectedButtonFrom:to:block:)] && _isIntercept) {//同时为真，才做拦截
        
        _toIndex = to;
        
        [self tabBarDidselectedButtonFrom:from to:to block:^{
            [self tabBarSelectedBtnSuccess];
        }];
        
    }else{
        
        [self tabBarSelectedBtnSuccess:to];
    }
}

/*
 Item：就是苹果的模型（用于保存数据）
 TabBarItem:决定着tabBars上按钮的内容
 如果通过模型设置控件的文字颜色，只能通过文本属性（富文本，颜色，字体，空心，阴影，图文混排）
 
 在IOS7之后，默认会把UITabBar上边的按钮
 
 */
#pragma mark 添所有的加子控制器
-(void)setUPAllChildViewController{
    
    [self.childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        UIViewController *vc = [NSClassFromString(dict[kClassKey]) new];
        vc.title = dict[kTitleKey];
        ZJNavigationController *nav = [[ZJNavigationController alloc] initWithRootViewController:vc];
        ZJTabBarItem *item = [[ZJTabBarItem alloc]init];
        item.title = dict[kTitleKey];
        item.image = [UIImage imageNamed:dict[kImgKey]];
        item.selectedImage = [[UIImage imageNamed:dict[kSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        item.itemNomalColor = self.itemNomalColor;
        item.itemSelectedColor = self.itemSelectedColor;
        item.font = self.font;
        
        [self addChildViewController:nav];//添加视图控制器
        [self.customTabBar addTabBarButtonWithItem:item];
    }];
}

/**
 *  @author zhengju, 16-05-13 15:05:50
 *
 *  @brief 重置，从二级及以后界面直接切换到首页界面
 */
- (void)reSetup {
    for (ZJNavigationController *navigationController in self.childViewControllers) {
        [navigationController popToRootViewControllerAnimated:NO];
    }
    self.defaultSelectedIndex = 0;
    
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    
    return YES;
}

- (void)tabBarSelectedBtnSuccess:(int)to{
    self.selectedIndex=to;
    [self.customTabBar selectedSuccess];
}
- (void)tabBarSelectedBtnSuccess{
    [self tabBarSelectedBtnSuccess:_toIndex];
}

@end
