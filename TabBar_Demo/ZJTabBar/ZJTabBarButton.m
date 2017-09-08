
 
//封装button
#define IWTabBarButtonImageRatio 0.6
#import "ZJTabBarButton.h"

#import "ZJTabBarItem.h"

#pragma mark - 颜色值
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
@interface ZJTabBarButton()

@end

@implementation ZJTabBarButton

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageW=contentRect.size.width;
     CGFloat imageH=contentRect.size.height*IWTabBarButtonImageRatio;
    return CGRectMake(0, 0, imageW , imageH);
}

//内部文字的frame
-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleY = contentRect.size.height*IWTabBarButtonImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height-titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}
//设置item
-(void)setItem:(ZJTabBarItem *)item{
    _item = item;
    //KVO监听属性改变
 
     [item addObserver:self forKeyPath:@"title" options:0 context:nil];
     [item addObserver:self forKeyPath:@"image" options:0 context:nil];
     [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    //设置 文字
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setTitle:self.item.title forState:UIControlStateSelected];
    //设置图片
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    [self setImage:self.item.image forState:UIControlStateNormal];
    
    [self setTitleColor:_item.itemSelectedColor forState:UIControlStateSelected];
    [self setTitleColor:_item.itemNomalColor forState:UIControlStateNormal];
    
    self.titleLabel.font = _item.font;
    
}

-(void)dealloc{
    
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}

/**
 *  监听到某个对象的属性改变，就会调用
 *
 *  @param keyPath 属性名
 *  @param object  哪个对象的属性被改变
 *  @param change  属性发生的改变
 *  @param context
 */

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    //做监听工作
}

-(id)initWithFrame:(CGRect)frame{
    
    if(self=[super initWithFrame:frame]){
        
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        

    }
    return self;
}
//重写去掉高亮的状态
-(void)setHighlighted:(BOOL)highlighted{
    
}
@end
