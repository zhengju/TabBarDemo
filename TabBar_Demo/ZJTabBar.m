
 
#import "ZJTabBar.h"
#import "ZJTabBarButton.h"

#import "ZjNavigationController.h"
 
@interface ZJTabBar()

@property(nonatomic,weak)ZJTabBarButton *selectedButton;
 
@end
@implementation ZJTabBar
-(NSMutableArray *)tabBarButtons{
    if(_tabBarButtons == nil){
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}
+ (id)shareTabBar
{
    static ZJTabBar *myTabBar = nil;
    static dispatch_once_t predicate;//对象必须是全局或者静态对象,如果不能保证这一点，也就不能保证该方法只会被执行一次。
    //该方法的作用就是执行且在整个程序的声明周期中，仅执行一次某一个block对象
    //&predicate这个断言的指针必须要全局化的保存，或者放在静态区内。使用存放在自动分配区域或者动态区域的断言，dispatch_once执行的结果是不可预知的。
    dispatch_once(&predicate, ^{
        myTabBar = [[ZJTabBar alloc]init];
    
    });
    
    return myTabBar;
}
-(void)addTabBarButtonWithItem:(UITabBarItem *)item{
    //1、创建按钮
    ZJTabBarButton *button=[[ZJTabBarButton alloc]init];
   
    [self addSubview:button];
    
    //添加按钮到数组中
    [self.tabBarButtons addObject:button];
    
    //2、设置数据
    button.item=item;
    
    //3、监听按钮点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    button.tag = self.tabBarButtons.count - 1;
    //4、默认选中第零个
    if(self.tabBarButtons.count==1){
        [self buttonClick:button];
    }
    
}
//监听按钮点击
-(void)buttonClick:(ZJTabBarButton *)button{

    if([self.delegate respondsToSelector:@selector(tabBar:didselectedButtonFrom:to:)]){
        [self.delegate tabBar:self didselectedButtonFrom:(int )self.selectedButton.tag to:(int)button.tag];
    }
    self.selectedButton.selected = NO;
    button.selected=YES;
    self.selectedButton=button;
}

-(void)layoutSubviews{

    [super layoutSubviews];
 
    CGFloat buttonW = self.frame.size.width/self.subviews.count;
        CGFloat buttonH = self.frame.size.height;
    
    CGFloat buttonY = 0;
    
    for(int index = 0;index<self.tabBarButtons.count;index++){
        
        ZJTabBarButton *button = self.tabBarButtons[index];
        
      CGFloat buttonX = index*buttonW;
 
        button.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        button.tag=index;
        
    }
}
//实现代理方法
- (void)LoginSuccess {
    
    
    ZJTabBarButton *button = [self viewWithTag:2];
    
    self.selectedButton.selected = NO;
    button.selected=YES;
    self.selectedButton=button;
    
    if([self.delegate respondsToSelector:@selector(tabBar:didselectedButtonFrom:to:)]){
        [self.delegate tabBar:self didselectedButtonFrom:(int )self.selectedButton.tag to:(int)button.tag];
    }
    self.selectedButton.selected = NO;
    button.selected=YES;

}
- (void)LoginCancel{

}

- (void)selectAtIndex:(NSInteger)index {
    if (index > self.tabBarButtons.count) {
        return;
    }
    ZJTabBarButton *button = self.tabBarButtons[index];
    [self buttonClick:button];
}
@end
