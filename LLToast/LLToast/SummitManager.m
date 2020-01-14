//
//  SummitManager.m
//  SummitToast_Example
//
//  Created by Summit的Macmini on 2020/1/13.
//  Copyright © 2020 1161248479@qq.com. All rights reserved.
//

#import "SummitManager.h"




#define sm_SCREEN_HEIGHT  [[UIScreen mainScreen] bounds].size.height
#define sm_SCREEN_WIDTH   [[UIScreen mainScreen] bounds].size.width
#define smDefaultRect     CGRectMake(0, 0, sm_SCREEN_WIDTH, sm_SCREEN_HEIGHT)
#define smDefaulyDelay  3

#define smWindow [[UIAsmlication sharedAsmlication] keyWindow]
#define smBlackColor  [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]
#define smClearCloler  [UIColor colorWithRed:1 green:1 blue:1 alpha:0]



NSInteger hudCount; //HUD的个数
BOOL isShow;    //是否显示HUD
UIColor *titleColor;    //字体颜色
UIColor *backgroundColor;   //背景颜色
UIColor *activityIndicatorColor;    //菊花颜色
NSNumber  *smAlpha;   //透明度
NSNumber  *smCornerRadius;   //圆角
NSInteger smLoaciton = 0;   //默认是中间

static SummitManager *mbManager = nil;


@implementation SummitManager



+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mbManager = [[SummitManager alloc] init];
        smAlpha = [NSNumber numberWithInteger:1];
        smCornerRadius = [NSNumber numberWithFloat:0];
    });
    
    return mbManager;
}

#pragma mark- 设置颜色
- (void)setTitleColor:(UIColor *)color{
    titleColor = color;
}


- (void)setBgColor:(UIColor *)color{
    backgroundColor = color;
}

- (void)setActivityIndicatorColor:(UIColor *)color{
    activityIndicatorColor = color;
}

- (void)setSMAlpha:(NSNumber *)alpha{
    smAlpha = alpha;
}

- (void)setSMCornerRadius:(NSNumber *)cornerRadius{
    smCornerRadius = cornerRadius;
}

- (void)setLoaction:(NSInteger)location{
    smLoaciton = location;
}

- (NSInteger)getHudCount{
    
    return hudCount;
}

- (void)setHudCount:(NSInteger)count{
    hudCount = count;
}

- (BOOL)getisShow{
    
    return isShow;
}

- (void)setisShow:(BOOL)show{
    
    isShow = show;
}

#pragma mark- 加载菊花

//加载菊花、显示遮罩
+ (void)showSMHUDAddedTo:(UIView *)inView{
//    [self smShowTitle:nil isShowShade:YES inView:inView model:SMMBHUDModeIndeterminate];
    
    [self smShowTitle:nil isShowShade:YES inView:inView model:SMMBHUDModeIndeterminate alphaValue:smAlpha bgColor:nil titleColor:nil cornerRadius:smCornerRadius];
}


//加载菊花、条件显示遮罩
+ (void)showSMHUDAddedTo:(UIView *)inView isShowShade:(BOOL)isShowShade{
//    [self smShowTitle:nil isShowShade:isShowShade inView:inView model:SMMBHUDModeIndeterminate];
    [self smShowTitle:nil isShowShade:isShowShade inView:inView model:SMMBHUDModeIndeterminate alphaValue:smAlpha bgColor:nil titleColor:nil cornerRadius:smCornerRadius];
}

//菊花+文字，显示遮罩
+ (void)showSMHUDAddedTo:(UIView *)inView withTitle:(NSString *)title{
//    [self smShowTitle:title isShowShade:YES inView:inView model:SMMBHUDModeIndeterminate];
    [self smShowTitle:title isShowShade:YES inView:inView model:SMMBHUDModeIndeterminate alphaValue:smAlpha bgColor:nil titleColor:nil cornerRadius:smCornerRadius];
}

//菊花+文字，条件显示遮罩
+ (void)showSMHUDAddedTo:(UIView *)inView withTitle:(NSString *)title isShowShade:(BOOL)isShowShade{
//    [self smShowTitle:title isShowShade:isShowShade inView:inView model:SMMBHUDModeIndeterminate];
    [self smShowTitle:title isShowShade:isShowShade inView:inView model:SMMBHUDModeIndeterminate alphaValue:smAlpha bgColor:nil titleColor:nil cornerRadius:smCornerRadius];
}


+ (void)showSMHudAddedTo:(UIView *)inView withTitle:(NSString *)title titleColor:(UIColor *)titleColor bgColor:(UIColor *)bgColor cornerRadius:(NSNumber *)cornerRadius alphaValue:(NSNumber *)alphaValue isShowShade:(BOOL)isShowShade{
    
    [self smShowTitle:title isShowShade:isShowShade inView:inView model:SMMBHUDModeIndeterminate alphaValue:alphaValue bgColor:bgColor titleColor:titleColor cornerRadius:cornerRadius];
}


#pragma mark- 加载进度条
//加载进度条,显示遮罩
+ (void)showSMProgressAddedTo:(UIView *)inView{
//    [self smShowTitle:nil isShowShade:YES inView:inView model:SMMBHUDModeDeterminateHorizontalBar];
    [self smShowTitle:nil isShowShade:YES inView:inView model:SMMBHUDModeDeterminateHorizontalBar alphaValue:smAlpha bgColor:nil titleColor:nil cornerRadius:0];
}

//加载进度条，条件显示遮罩
+ (void)showSMProgressAddedTo:(UIView *)inView isShowShade:(BOOL)isShowShade{
//    [self smShowTitle:nil isShowShade:isShowShade inView:inView model:SMMBHUDModeDeterminateHorizontalBar];
    [self smShowTitle:nil isShowShade:isShowShade inView:inView model:SMMBHUDModeDeterminateHorizontalBar alphaValue:smAlpha bgColor:nil titleColor:nil cornerRadius:0];
}

//进度条+文字，添加显示遮罩
+ (void)showSMProgressAddedTo:(UIView *)inView withTitle:(NSString *)title{
//    [self smShowTitle:title isShowShade:YES inView:inView model:SMMBHUDModeDeterminateHorizontalBar];
    [self smShowTitle:title isShowShade:YES inView:inView model:SMMBHUDModeDeterminateHorizontalBar alphaValue:smAlpha bgColor:nil titleColor:nil cornerRadius:0];
}

+ (void)showSMProgressAddedTo:(UIView *)inView withTitle:(NSString *)title isShowShade:(BOOL)isShowShade{
//    [self smShowTitle:title isShowShade:isShowShade inView:inView model:SMMBHUDModeDeterminateHorizontalBar];
    [self smShowTitle:title isShowShade:isShowShade inView:inView model:SMMBHUDModeDeterminateHorizontalBar alphaValue:smAlpha bgColor:nil titleColor:nil cornerRadius:0];
}


#pragma mark- 加载圆环

//加载圆环，显示遮罩
+ (void)showSMAnnularAddedTo:(UIView *)inView{
    [self smShowTitle:nil isShowShade:YES inView:inView model:SMMBHUDModeAnnularDeterminate alphaValue:smAlpha bgColor:nil titleColor:nil cornerRadius:smCornerRadius];
}

//加载圆环，条件显示遮罩
+ (void)showSMAnnularAddedTo:(UIView *)inView isShowShade:(BOOL)isShowShade{
    [self smShowTitle:nil isShowShade:isShowShade inView:inView model:SMMBHUDModeAnnularDeterminate alphaValue:smAlpha bgColor:nil titleColor:nil cornerRadius:smCornerRadius];
}

//圆环+文字，显示遮罩
+ (void)showSMAnnularAddedTo:(UIView *)inView withTitle:(NSString *)title{
    [self smShowTitle:title isShowShade:YES inView:inView model:SMMBHUDModeAnnularDeterminate alphaValue:smAlpha bgColor:nil titleColor:nil cornerRadius:smCornerRadius];
}

//圆环+文字，条件显示遮罩
+ (void)showSMAnnularAddedTo:(UIView *)inView withTitle:(NSString *)title isShowShade:(BOOL)isShowShade{
    [self smShowTitle:title isShowShade:isShowShade inView:inView model:SMMBHUDModeAnnularDeterminate alphaValue:smAlpha bgColor:nil titleColor:nil cornerRadius:smCornerRadius];
}

#pragma mark- 加载圆饼

//加载圆饼，显示遮罩
+ (void)showSMCakeAddedTo:(UIView *)inView{
    [self smShowTitle:nil isShowShade:YES inView:inView model:SMMBHUDModeDeterminate alphaValue:smAlpha bgColor:nil titleColor:nil cornerRadius:smCornerRadius];
}

//加载圆饼、条件显示遮罩

+(void)showSMCakeAddedTo:(UIView *)inView isShowShade:(BOOL)isShowShade{
    [self smShowTitle:nil isShowShade:isShowShade inView:inView model:SMMBHUDModeDeterminate alphaValue:smAlpha bgColor:nil titleColor:nil cornerRadius:smCornerRadius];
}

//圆饼+文字,显示遮罩
+ (void)showSMCakeAddedTo:(UIView *)inView withTitle:(NSString *)title{
    [self smShowTitle:title isShowShade:YES inView:inView model:SMMBHUDModeDeterminate alphaValue:smAlpha bgColor:nil titleColor:nil cornerRadius:smCornerRadius];
}

//圆饼+文字,条件显示遮罩
+ (void)showSMCakeAddedTo:(UIView *)inView withTitle:(NSString *)title isShowShade:(BOOL)isShowShade{
    [self smShowTitle:title isShowShade:isShowShade inView:inView model:SMMBHUDModeDeterminate alphaValue:smAlpha bgColor:nil titleColor:nil cornerRadius:smCornerRadius];
}

#pragma mark- 动画

//动画，显示遮罩
+ (void)showSMAnimationAddedTo:(UIView *)inView withImageArray:(nonnull NSArray *)imageArray animationMode:(SMFrameAnimationMode)mode{
    [self smShowAnimationTitle:nil isShowShade:YES inView:inView imageArray:imageArray model:mode];
}

//动画，条件显示遮罩
+ (void)showSMAnimationAddedTo:(UIView *)inView withImageArray:(nonnull NSArray *)imageArray isShowShade:(BOOL)isShowShade animationMode:(SMFrameAnimationMode)mode{
    [self smShowAnimationTitle:nil isShowShade:isShowShade inView:inView imageArray:imageArray model:mode];
}

//动画+文字，显示遮罩
+ (void)showSMAnimationAddedTo:(UIView *)inView withImageArray:(nonnull NSArray *)imageArray withTitle:(nonnull NSString *)title animationMode:(SMFrameAnimationMode)mode{
    [self smShowAnimationTitle:title isShowShade:YES inView:inView imageArray:imageArray model:mode];
}

//动画+文字，条件显示遮罩
+ (void)showSMAnimationAddedTo:(UIView *)inView withImageArray:(nonnull NSArray *)imageArray withTitle:(nonnull NSString *)title isShowShade:(BOOL)isShowShade animationMode:(SMFrameAnimationMode)mode{
    [self smShowAnimationTitle:title isShowShade:isShowShade inView:inView imageArray:imageArray model:mode];
}


#pragma mark- 短时间消失

//显示icon,显示遮罩

+ (void)showSMToastAddedTo:(UIView *)view Icon:(NSString *)icon{
    [self showSMToastAddedTo:view Icon:icon isShowShade:YES];
}


//显示icon，条件显示遮罩
+ (void)showSMToastAddedTo:(UIView *)view Icon:(NSString *)icon isShowShade:(BOOL)isShowShade{
    [self showSMToastAddedTo:view Icon:icon withTitle:@"" isShowShade:isShowShade];
}


//icon+文字，显示遮罩
+ (void)showSMToastAddedTo:(UIView *)view Icon:(NSString *)icon withTitle:(NSString *)title{
    [self showSMToastAddedTo:view Icon:icon withTitle:title isShowShade:YES];
}

//icon+文字，条件显示遮罩
+ (void)showSMToastAddedTo:(UIView *)view Icon:(NSString *)icon withTitle:(NSString *)title isShowShade:(BOOL)isShowShade{
    [self smShowToastAddedToView:view Icon:icon message:title isShowShade:isShowShade];
}

//显示文字，现实遮罩
+ (void)showSMToastAddedTo:(UIView *)view Message:(NSString *)message{
    [self smShowToastAddedTo:view Message:message isShowShade:YES titleColor:nil bgColor:nil alphaValue:nil cornerRadius:nil location:SMMBHUDLocationDefault];
}


//显示文字，条件显示遮罩

+ (void)showSMToastAddedTo:(UIView *)view Message:(NSString *)message isShowShade:(BOOL)isShowShade{
    [self smShowToastAddedTo:view Message:message isShowShade:isShowShade titleColor:nil bgColor:nil alphaValue:nil cornerRadius:nil location:SMMBHUDLocationDefault];
}

//配置toast提示框
+ (SummitManager*)showSMToastAddedTo:(UIView *)view Message:(NSString *)message titleColor:(UIColor *)titleColor bgColor:(UIColor *)bgColor cornerRadius:(NSNumber *)cornerRadius alphaValue:(NSNumber *)alphaValue loaction:(NSInteger)loaction isShowShade:(BOOL)isShowShade{
    mbManager =  [self smShowToastAddedTo:view Message:message isShowShade:isShowShade titleColor:titleColor bgColor:bgColor alphaValue:alphaValue cornerRadius:cornerRadius location:loaction];
    
    return mbManager;
    
}

#pragma mark- 方法具体实现

/**
 显示HUD
 
 @param title 提示语
 @param isShowShade 是否显示遮罩层
 @param inView 承载view
 @param mbMode hud的模式
 */
+ (void)smShowTitle:(NSString *)title isShowShade:(BOOL)isShowShade inView:(UIView *)inView model:(SMMBHUDMode)mbMode alphaValue:(NSNumber *)alpah bgColor:(UIColor *)bgColor titleColor:(UIColor *)color cornerRadius:(NSNumber *)cornerRadius {

    //累积HUD个数
    NSInteger count = [[SummitManager shareInstance] getHudCount];
    count ++;
    [[SummitManager shareInstance] setHudCount:count];
//    NSLog(@"------SMmanger  hud ++count-----%d--",(int)count);
    if ([[SummitManager shareInstance] getisShow]) {
        //已经有HUD存在
        return;
    }
    if (hudCount > 0) {
        
        //创建hud
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:inView animated:YES];
        
        //配置hud
        [[self class] configureColorForHud:hud titleColor:color bgColor:bgColor alpha:alpah cornerRadius:cornerRadius];
        
        //设置菊花颜色
        if (activityIndicatorColor) {
            [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[MBProgressHUD class]]].color = activityIndicatorColor;
        }
        
        
        hud.label.text = title;
        if (isShowShade) {
            //有遮罩
            hud.userInteractionEnabled = YES;
        }else{
            //无遮罩
            hud.userInteractionEnabled = NO;
        }
        switch (mbMode) {
            case SMMBHUDModeOnlyText:
                hud.mode = MBProgressHUDModeText;
                break;
            case SMMBHUDModeOnlyIcon:
                
                break;
            case SMMBHUDModeAnimaiton:
                
                break;
            case SMMBHUDModeFrameAnimaiton:

                break;
            case SMMBHUDModeIconAndText:
                
                break;
            case SMMBHUDModeIndeterminate:
                hud.mode = MBProgressHUDModeIndeterminate;
                break;
            case SMMBHUDModeDeterminate:
            {
                hud.mode = MBProgressHUDModeDeterminate;
            }
                break;
            case SMMBHUDModeDeterminateHorizontalBar:
                hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
                break;
            case SMMBHUDModeAnnularDeterminate:
                hud.mode = MBProgressHUDModeAnnularDeterminate;
                [hud showWhileExecuting:@selector(progressTask:) onTarget:self withObject:nil animated:YES];
                break;
            default:
                break;
        }
        
        [[SummitManager shareInstance] setisShow:YES];
    }
}



/**
 显示动画

 @param title 提示语
 @param isShowShade 是否显示遮罩
 @param inView 承载view
 @param imageArray 图片数组
 @param mode 动画模式
 */
+ (void)smShowAnimationTitle:(NSString *)title isShowShade:(BOOL)isShowShade inView:(UIView *)inView imageArray:(NSArray *)imageArray model:(SMFrameAnimationMode )mode{

    
    MBProgressHUD *hud = [[self class] createHudInView:inView showTime:smDefaulyDelay];
    [inView addSubview:hud];
    
    UIImageView *imageView = [UIImageView new];
    
    switch (mode) {
        case SMFrameAnimationModeFrame:
        {//帧动画
           
            imageView.animationImages = imageArray;
            imageView.animationDuration = 0.7;
            [imageView startAnimating];
        }
            break;
        case SMFrameAnimationModeCircle:
        {//旋转动画
            //默认传入一张
            imageView.image = imageArray[0];
            
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
            //默认是顺时针效果，若将fromValue和toValue的值互换，则为逆时针效果
            animation.fromValue = @(0);
            animation.toValue = @(M_PI * 2.0);
            animation.duration = 1;
            animation.repeatCount = MAXFLOAT;
            animation.cumulative = YES;
            [imageView.layer addAnimation:animation forKey:@"animation"];
            
        }
            break;
        case SMFrameAnimationModeSwitch:
        {//切换动画
            
        }
            break;
            
        default:
            break;
    }
    
    //设置动画
    hud.customView = imageView;
    
    if (isShowShade) {
        //有遮罩
        hud.userInteractionEnabled = YES;
    }else{
        //无遮罩
        hud.userInteractionEnabled = NO;
    }
    
    //自定义
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.text = title;
    [hud showAnimated:YES];
}



/**
 icon Toast

 @param view view
 @param iconName icon名字
 @param message 信息内容
 @param isShowShade 是否显示遮罩
 */
+ (void)smShowToastAddedToView:(UIView *)view Icon:(NSString *)iconName message:(NSString *)message isShowShade:(BOOL)isShowShade{
    
    dispatch_async(dispatch_get_main_queue(), ^{
       
        UIWindow *keyboardWindow = [[UIApplication sharedApplication].windows lastObject];
        MBProgressHUD *hud = [[self class] createHudInView:view?view:keyboardWindow showTime:smDefaulyDelay];
        hud.mode = MBProgressHUDModeCustomView;
        UIImage *img = [UIImage imageNamed:iconName];
        hud.customView = [[UIImageView alloc] initWithImage:img];
        
        if (!isShowShade) {
            //有遮罩
            hud.userInteractionEnabled = NO;
        }else{
            hud.userInteractionEnabled = YES;
        }
        hud.label.text = message;
        [[self class] setColorForHud:hud];
    });
}


/**
 Toast信息提示

 @param view 承载view
 @param message 提示内容
 @param isShowShade 是否有遮罩
 @param titleColor 文字颜色
 @param bgColor 背景色
 @param alpha 透明度值
 @param cornerRadius 圆角值
 @param location 位置
 */
+ (SummitManager *)smShowToastAddedTo:(UIView *)view Message:(NSString *)message  isShowShade:(BOOL)isShowShade titleColor:(UIColor *)titleColor bgColor:(UIColor *)bgColor alphaValue:(NSNumber *)alpha cornerRadius:(NSNumber *)cornerRadius location:(NSInteger)location{
    
    UIWindow *keyboardWindow = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [[self class] createHudInView:view?view:keyboardWindow showTime:smDefaulyDelay];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor clearColor];
    mbManager = [SummitManager shareInstance];
    if (!isShowShade) {
        //有遮罩
        hud.userInteractionEnabled = NO;
    }else{
        hud.userInteractionEnabled = YES;
    }
    
    hud.label.text = message;

    //修改hud背景view的大小
    hud.margin = 15;
    
    //配置hud颜色、属性
    [[self class] configureColorForHud:hud titleColor:titleColor bgColor:bgColor alpha:alpha cornerRadius:cornerRadius];
    
    //修改hud位置
    [[self class] configureLoactionForHud:hud view:view  loaction:location];
    
    return mbManager;
    
}



//移除HUD
+ (void)hideSMHUDFromView:(UIView *)inView{
    
   __block NSInteger count = [[SummitManager shareInstance] getHudCount];
    
    if (count > 0) {
        
        if (count == 1) {
            //当只有一个HUD的时候，延迟0.5秒隐藏，避免第二个快速出现，导致hud闪烁
            [NSThread sleepForTimeInterval:0.5];
            //个数减一
            count --;
        }else{
            //直接个数减一
            count --;
        }
        [[SummitManager shareInstance] setHudCount:count];
    }

//    NSLog(@"------SMmanger  hud --count-----%d--",(int)count);
    if (count == 0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:inView animated:YES];
            [[SummitManager shareInstance] setisShow:NO];
        });
    }
}


//重置HUD个数和显示状态
+ (void)resetSMHUDFromView:(UIView *)inView{
    
    [MBProgressHUD hideHUDForView:inView animated:YES];
    [[SummitManager shareInstance] setHudCount:0];
    [[SummitManager shareInstance] setisShow:NO];
    
}

//设置显示HUD
+ (MBProgressHUD *)createHudInView:(UIView *)view showTime:(NSTimeInterval)showTime{
    MBProgressHUD *hud = nil;
    for (UIView *subview in view.subviews) {
        if ([subview isKindOfClass:[MBProgressHUD class]]) {
            hud = (MBProgressHUD *)subview;
            [NSObject cancelPreviousPerformRequestsWithTarget:hud];
            [hud showAnimated:YES];
            [hud hideAnimated:YES afterDelay:showTime];
            break;
        }
    }
    
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        [[self class] setupHudCommonStyle:hud showTime:showTime];
    }
    
    return hud;
}

//创建HUD
+ (void)setupHudCommonStyle:(MBProgressHUD *)hud showTime:(NSTimeInterval)showTime{
    hud.mode = MBProgressHUDModeText;
    
    [[self class] setColorForHud:hud];
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:showTime];
}


/**
 设置hud位置

 @param hud hud对象
 @param view 承载view
 @param loaction l位置
 
 */
+ (void)configureLoactionForHud:(MBProgressHUD *)hud view:(UIView *)view loaction:(NSInteger)loaction{
    
    
    if (!view) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    CGFloat averageHeight = view.bounds.size.height/3;
    
    if (loaction > 0) {
        //本次设置了位置
    }else{
        if (smLoaciton) {
            //外界设置了位置
            loaction = smLoaciton;
        }else{
            //使用默认的设置
            loaction = SMMBHUDLocationDefault;
        }
    }
    
    
    switch (loaction) {
        case SMMBHUDLocationDefault:
            hud.yOffset = 0;
            break;
            
            case SMMBHUDLocationTop:
            hud.yOffset = -(averageHeight*2);
            break;
            
            case SMMBHUDLocationBottom:
            hud.yOffset = averageHeight/2;
            break;
            
        default:
            break;
    }
}


/**
 配置hud的颜色

 @param hud hud对象
 @param color 字体颜色
 @param bgColor 背景颜色
 @param alpha 透明度
 */
+ (void)configureColorForHud:(MBProgressHUD *)hud titleColor:(UIColor *)color bgColor:(UIColor *)bgColor alpha:(NSNumber *)alpha cornerRadius:(NSNumber *)cornerRadius{
    
    mbManager.smHud = hud;
    
    //设置字体颜色
    if (color) {
        //本次设置了字体颜色
        mbManager.smHud.label.textColor = color;
        mbManager.smHud.detailsLabel.textColor = color;
    }else{
        //本次未设置字体颜色，判断全局颜色是否存在
        if (titleColor) {
            //设置了字体颜色
            mbManager.smHud.label.textColor = titleColor;
            mbManager.smHud.detailsLabel.textColor = titleColor;
        }else{
            //未设置字体颜色
            mbManager.smHud.label.textColor = [UIColor whiteColor];
            mbManager.smHud.detailsLabel.textColor = [UIColor whiteColor];
        }
    }
    
    //设置背景颜色
    if (bgColor) {
        //本次有设置背景颜色
        hud.bezelView.backgroundColor = bgColor;
    }else{
        //本次未设置默认背景颜色，则判断全局背景颜色是否存在
        if (backgroundColor) {
            //外面有设置背景颜色
            hud.bezelView.backgroundColor = backgroundColor;
        }else{
            //默认背景颜色
            hud.bezelView.backgroundColor = [UIColor blackColor];
        }
    }
    
    //设置透明度
    if (alpha) {
        //判断本次是否设置透明度
        hud.bezelView.alpha = [alpha floatValue];
    }else{
        //本次未设置透明度，则判断全局透明度是否设置
        if (smAlpha) {
            hud.bezelView.alpha = [smAlpha floatValue];
        }else{
            hud.bezelView.alpha = 0.8;
        }
    }
    
    //设置圆角
    if (cornerRadius) {
        //本次设置了圆角
        hud.bezelView.layer.cornerRadius = [cornerRadius floatValue];
    }else{
        //本次未设置了圆角,则判断全局圆角是否设置
        if (smCornerRadius) {
            hud.bezelView.layer.cornerRadius = [smCornerRadius floatValue];
        }else{
            //默认是直角
            hud.bezelView.layer.cornerRadius = 0;
        }
    }
    
}

//给HUD设置颜色
+ (void)setColorForHud:(MBProgressHUD *)hud{
    
    mbManager.smHud = hud;
    if (titleColor) {
        //设置了字体颜色
        mbManager.smHud.label.textColor = titleColor;
        mbManager.smHud.detailsLabel.textColor = titleColor;
    }else{
        //未设置字体颜色
        mbManager.smHud.label.textColor = [UIColor whiteColor];
        mbManager.smHud.detailsLabel.textColor = [UIColor whiteColor];
    }
    
    
    if (backgroundColor) {
        //外面有设置背景颜色
        mbManager.smHud.bezelView.backgroundColor = backgroundColor;
    }else{
        //默认背景颜色
        mbManager.smHud.bezelView.backgroundColor = [UIColor blackColor];
    }
    
    if (smAlpha) {
        mbManager.smHud.bezelView.alpha = [smAlpha floatValue];
    }else{
        mbManager.smHud.bezelView.alpha = 0.8;
    }
    
    
    
    if (activityIndicatorColor) {
        [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[MBProgressHUD class]]].color = activityIndicatorColor;
    }
}

+ (void)progressTask:(MBProgressHUD *)hud{
    float progress = 0.0f;
    while (progress < 1.0f) {
        progress += 0.01f;
        hud.progress = progress;
    }
}


//设置label的高度
+ (CGSize)labelAutoCalculateRectWith:(UILabel *)label FontSize:(CGFloat)fontSize MaxSize:(CGSize)maxSize{
    
    //需要穿进去三个参数：给哪个label设置frame；label的字体大小；maxSize就是设置最大的frame数值，具体情况根据你的label最大值来定
    
    //设置文字的段落样式
    NSMutableParagraphStyle* paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode=NSLineBreakByWordWrapping;
    paragraphStyle.lineSpacing = 3;
    
    //这个字典是为了下面计算label的frame 创建的；里面的参数：第一个是字体的大小、第二个是段落样式
    NSDictionary* attributes =@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize],NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    
    //计算labelframe
    CGSize labelSize = [label.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    //ceil  就是给float、double四舍五入，
    labelSize.height=ceil(labelSize.height);
    
    labelSize.width=ceil(labelSize.width);
    
    label.font = [UIFont systemFontOfSize:fontSize];
    
    //设置行间距
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:label.text];;
    [paragraphStyle setLineSpacing:3];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, label.text.length)];
    [label sizeToFit];
    label.attributedText = attributedString;
    
    //重新设置label frame
    label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, labelSize.width,labelSize.height);
    
    //返回label的大小
    return labelSize;
}

@end
