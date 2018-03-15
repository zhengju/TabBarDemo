
#import "ZJTabBarButton.h"

@interface ZJTabBarNormalBtn()

@end
@implementation ZJTabBarNormalBtn

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageW=contentRect.size.width;
    CGFloat imageH=contentRect.size.height * 0.8;
    return CGRectMake(0, contentRect.size.height * 0.1, imageW , imageH);
}

//内部文字的frame
-(CGRect)titleRectForContentRect:(CGRect)contentRect{

    return CGRectMake(0, 0, 0, 0);
}


@end

//封装button


#import "ZJTabBarItem.h"
#pragma mark - 颜色值
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
@interface ZJTabBarButton()
@property(strong,nonatomic) UILabel * badgeValueLabel;
@end

@implementation ZJTabBarButton

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageW=contentRect.size.width;
     CGFloat imageH=contentRect.size.height*ZJTabBarButtonImageRatio;
    return CGRectMake(0, 0, imageW , imageH);
}

//内部文字的frame
-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleY = contentRect.size.height*ZJTabBarButtonImageRatio;
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
    
    self.badgeValue = item.badgeValue;
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
- (void)setBadgeValue:(NSString *)badgeValue{
    if ([badgeValue length] == 0 || badgeValue == nil || [badgeValue integerValue] == 0) {
        self.badgeValueLabel.hidden = YES;
        return;
    }
    self.badgeValueLabel.hidden  = NO;
    self.badgeValueLabel.text = badgeValue;
    if ([badgeValue integerValue] >99) {
        self.badgeValueLabel.text = @"99+";
    }
    
}
- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    self.badgeValueLabel.frame = CGRectMake(frame.size.width-30, 0, 30, 30);
    
}
-(id)initWithFrame:(CGRect)frame{
    
    if(self=[super initWithFrame:frame]){
        
        self.imageView.contentMode = UIViewContentModeCenter;
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;

        [self addSubview:self.badgeValueLabel];

    }
    return self;
}
//重写去掉高亮的状态
-(void)setHighlighted:(BOOL)highlighted{
    
}
- (UILabel *)badgeValueLabel{
    if (_badgeValueLabel == nil) {
        
        _badgeValueLabel = [[UILabel alloc]init];
        _badgeValueLabel.backgroundColor = [UIColor redColor];
        _badgeValueLabel.textColor = [UIColor whiteColor];
        _badgeValueLabel.font = [UIFont systemFontOfSize:13];
        _badgeValueLabel.textAlignment = NSTextAlignmentCenter;
        _badgeValueLabel.layer.masksToBounds = YES;
        _badgeValueLabel.layer.cornerRadius = 15;
    }
    return _badgeValueLabel;
}
@end
