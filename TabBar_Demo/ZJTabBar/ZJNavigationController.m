
#import "ZJNavigationController.h"

@interface ZJNavigationController ()

@end

@implementation ZJNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.navigationBarHidden = YES;
    /**
     事实上对于一个视图控制器而言，该属性的默认值即为YES，因此不设置也能实现右滑pop的功能。然而这个功能很有局限性，因为它不允许当前视图控制器自定义了leftBarButtonItem，一旦自定义，右滑功能就会失效
     */
    self.interactivePopGestureRecognizer.delegate = nil;
}

/**
 *  @author zhengju, 16-05-23 17:05:28
 *
 *  @brief 重写这个方法，能拦截所有的push方法
 *
 *  @param viewController 下一级视图控制器
 *  @param animated       是否带动画
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
  
    if (self.viewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed=YES;
        
    }
    
    [super pushViewController:viewController animated:YES];
}
@end
