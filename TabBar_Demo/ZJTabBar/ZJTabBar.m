

#import "ZJTabBar.h"
#import "ZJTabBarItem.h"
#import "ZJTabBarButton.h"
#import "ZJNavigationController.h"

@interface ZJTabBar()
{
    NSInteger _index;//若是做拦截，记录下当前选择的按钮位置
}
@property(nonatomic,weak)ZJTabBarButton *selectedButton;
@property(nonatomic,strong)NSMutableArray *tabBarButtons;
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
- (instancetype)init{
    if (self = [super init]) {
        self.separateBtnIndex = 0;//给定一个默认值
    }
    return self;
}
-(void)addTabBarButtonWithItem:(ZJTabBarItem *)item{
    //1、创建按钮
    
    ZJTabBarButton *button=[[ZJTabBarButton alloc]init];
    button.badgeValue = item.badgeValue;
    //判断是否添加中间为大按钮
    if (self.tabBarButtons.count == _separateBtnIndex && _separateBtnIndex != 0) {

         button=[[ZJTabBarNormalBtn alloc]init];

    }

    [self addSubview:button];

    //添加按钮到数组中
    [self.tabBarButtons addObject:button];
    
    //2、设置数据
    button.item=item;
    
    //3、监听按钮点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    button.tag = self.tabBarButtons.count - 1;
    //4、默认选中第零个
    self.selectedIndex = 0;
    _index = 0;
}

-(void)switchTabBarButtonWithItem:(ZJTabBarItem *)item atIndex:(NSInteger)index{
    if (index < [self.tabBarButtons count]) {
        ZJTabBarButton *button = self.tabBarButtons[index];
        button.item = item;
    }
}
#pragma mark -- 设置角标
-(void)badgeValueTabBarButtonWithItem:(ZJTabBarItem *)item atIndex:(NSInteger)index{
    if (index < [self.tabBarButtons count]) {
        ZJTabBarButton *button = self.tabBarButtons[index];
        button.badgeValue = item.badgeValue;
    }
    
}
- (void)setSelectedIndex:(NSInteger)selectedIndex{
    
    if ((_selectedIndex < self.tabBarButtons.count) && self.tabBarButtons.count > 0) {
        _selectedIndex = selectedIndex;
        _index = _selectedIndex;
        ZJTabBarButton * button = nil;
        if (_selectedIndex >= [self.tabBarButtons count]) {
    
            button = [self.tabBarButtons lastObject];
        }else{
           
            button = [self.tabBarButtons objectAtIndex:_selectedIndex];
        }
        
        
        [self buttonClick:button];
    }
}

/**
 监听按钮点击
 
 @param button 传入的button
 */
-(void)buttonClick:(ZJTabBarButton *)button{
    
    if (self.selectedButton != button) {
        
        _index = button.tag;
        
        if([self.delegate respondsToSelector:@selector(tabBar:didselectedButtonFrom:to:)]){
            
            [self.delegate tabBar:self didselectedButtonFrom:(int )self.selectedButton.tag to:(int)button.tag];
        }
    }
}

- (void)selectedSuccess{
    
    ZJTabBarButton * button = self.tabBarButtons[_index];
    
    //几个按钮的互斥选择，点击成功才能换按钮的
    self.selectedButton.selected = NO;
    button.selected=YES;
    self.selectedButton= button;
    
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
        
        //判断是否添加中间为大按钮
        if (index == _separateBtnIndex && _separateBtnIndex != 0 && self.isSeparateBtnHit == YES) {
             button.frame=CGRectMake(buttonX, -60, buttonW, buttonH + 60);
            
        }
    }
}
/**
 重写事件
 */
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {

    UIView *result = [super hitTest:point withEvent:event];

    if (result == nil) {
        ZJTabBarNormalBtn * button = self.tabBarButtons[_separateBtnIndex];
        
        CGPoint buttonPoint = [button convertPoint:point fromView:self];
        
        if ([button pointInside:buttonPoint withEvent:event]) {
            result = button;
        }
    }
    
   
    return result;
}

//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
//    return NO;
//
//}

@end
