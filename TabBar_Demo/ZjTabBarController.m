

#import "ZJTabBarController.h"

#import "ZJNavigationController.h"
#import <objc/message.h>
#import "ZJTabBar.h"
#import "ZJTabBarButton.h"

@interface ZJTabBarController ()<ZJTabBarDetagate>
@property(nonatomic,weak)ZJTabBar *customTabBar;
@end

@implementation ZJTabBarController

+(void)initialize{

    UITabBar * tabBar = [UITabBar appearance];

   tabBar.backgroundImage = [UIImage imageNamed:@"tabella-beijing"];
   tabBar.backgroundColor = [UIColor blackColor];

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
    
    customTabBar.frame=self.tabBar.bounds;
    
    self.customTabBar=customTabBar;
    
    customTabBar.delegate=self;
    
    [self.tabBar addSubview:customTabBar];
    
}

//监听按的改变
- (void)tabBar:(ZJTabBar *)tabBar didselectedButtonFrom:(int)from to:(int)to{
    
    self.selectedIndex=to;

    
}

- (void)didselectedButtonFrom:(int)from to:(int)to {
    self.selectedIndex=to;
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
        UITabBarItem *item = nav.tabBarItem;
        item.title = dict[kTitleKey];
        item.image = [UIImage imageNamed:dict[kImgKey]];
        item.selectedImage = [[UIImage imageNamed:dict[kSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
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
    [self.customTabBar selectAtIndex:0];
    
}

@end
