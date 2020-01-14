//
//  SummitManager.h
//  SummitToast_Example
//
//  Created by Summit的Macmini on 2020/1/13.
//  Copyright © 2020 1161248479@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

//显示模式
typedef NS_ENUM(NSInteger, SMMBHUDMode) {
    
    SMMBHUDModeOnlyText,  //文字
    SMMBHUDModeOnlyIcon,  //icon
    SMMBHUDModeAnimaiton, //动画
    SMMBHUDModeFrameAnimaiton, //帧动画
    SMMBHUDModeIconAndText,    //icon+文字
    SMMBHUDModeIndeterminate,     //菊花
    SMMBHUDModeDeterminate,       //圆饼
    SMMBHUDModeDeterminateHorizontalBar,  //进度条
    SMMBHUDModeAnnularDeterminate    //圆环
};

//动画类型模式
typedef NS_ENUM(NSInteger, SMFrameAnimationMode) {
    SMFrameAnimationModeFrame,    //帧动画
    SMFrameAnimationModeCircle,    //旋转动画
    SMFrameAnimationModeSwitch   //切换动画
    
};

//动画消失类型
typedef NS_ENUM(NSInteger, SMMBHUDAnimation) {
    SMMBHUDAnimationFade, //渐变
    SMMBHUDAnimationZoom, //逐渐变小
    SMMBHUDAnimationZoomOut,  //逐渐变小
    SMMBHUDAnimationZoomIn   //逐渐变大
};


typedef NS_ENUM(NSInteger, SMMBHUDLocation) {
    //位置相对于 承载view
    SMMBHUDLocationDefault,   //默认居中
    SMMBHUDLocationTop,   //上面
    SMMBHUDLocationBottom //下面
    
};

@interface SummitManager : NSObject

@property (nonatomic, strong) MBProgressHUD *smHud;

+ (instancetype)shareInstance;

#pragma mark- 设置颜色


/**
 设置文字颜色

 @param color 颜色值
 */
- (void)setTitleColor:(UIColor*)color;



/**
 设置菊花背景颜色

 @param color 颜色值
 */
- (void)setBgColor:(UIColor *)color;


/**
 设置菊花颜色

 @param color 颜色值
 */
- (void)setActivityIndicatorColor:(UIColor *)color;


/**
 设置透明度

 @param alpha 透明度
 */
- (void)setSMAlpha:(NSString *)alpha;



/**
 设置HUD location

 @param location 上中下位置
 */
- (void)setLoaction:(NSInteger)location;

/**
 设置圆角

 @param cornerRadius 圆角值
 */
- (void)setSMCornerRadius:(NSString *)cornerRadius;

#pragma mark- 长时间停留

/**
 仅仅显示菊花

 @param inView 承载view
 */
+ (void)showSMHUDAddedTo:(UIView *)inView;



/**
 仅仅显示菊花

 @param inView 承载view
 @param isShowShade 是否显示遮罩层
 */
+ (void)showSMHUDAddedTo:(UIView *)inView isShowShade:(BOOL)isShowShade;



/**
 菊花+文字

 @param inView 承载view
 @param title 提示语
 */
+ (void)showSMHUDAddedTo:(UIView *)inView withTitle:(NSString *)title;



/**
 菊花+文字

 @param inView 承载view
 @param title 提示语
 @param isShowShade 是否显示遮罩层
 */
+ (void)showSMHUDAddedTo:(UIView *)inView withTitle:(NSString *)title isShowShade:(BOOL)isShowShade;



/**
 配置菊花

 @param inView 承载view
 @param title 标题
 @param titleColor 标题颜色
 @param bgColor 背景颜色
 @param cornerRadius 圆角值
 @param alphaValue 透明度值
 @param isShowShade 是否显示遮罩层
 */
+ (void)showSMHudAddedTo:(UIView *)inView withTitle:(NSString *)title titleColor:(UIColor *)titleColor bgColor:(UIColor *)bgColor cornerRadius:(NSNumber *)cornerRadius alphaValue:(NSNumber *)alphaValue isShowShade:(BOOL)isShowShade;


/**
 显示进度条，长时间停留

 @param inView 承载view
 */
+ (void)showSMProgressAddedTo:(UIView *)inView;


/**
 显示进度条

 @param inView 承载view
 @param isShowShade 是否显示遮罩层
 */
+ (void)showSMProgressAddedTo:(UIView *)inView isShowShade:(BOOL)isShowShade;


/**
 进度条+文字

 @param inView 承载view
 @param title 提示语
 */
+ (void)showSMProgressAddedTo:(UIView *)inView withTitle:(NSString *)title;


/**
 进度条+文字

 @param inView 承载view
 @param title 提示语
 @param isShowShade 是否显示遮罩层
 */
+ (void)showSMProgressAddedTo:(UIView *)inView withTitle:(NSString *)title isShowShade:(BOOL)isShowShade;



/**
 显示圆环

 @param inView 承载view
 */
+ (void)showSMAnnularAddedTo:(UIView *)inView;


/**
 显示圆环

 @param inView 承载view
 @param isShowShade 是否显示遮罩层
 */
+ (void)showSMAnnularAddedTo:(UIView *)inView isShowShade:(BOOL)isShowShade;



/**
 圆环+文字

 @param inView 承载view
 @param title 提示语
 */
+ (void)showSMAnnularAddedTo:(UIView *)inView withTitle:(NSString *)title;



/**
 圆环+文字

 @param inView 承载view
 @param title 提示语
 @param isShowShade 是否显示圆环
 */
+ (void)showSMAnnularAddedTo:(UIView *)inView withTitle:(NSString *)title isShowShade:(BOOL)isShowShade;



/**
 显示圆饼

 @param inView 承载view
 */
+ (void)showSMCakeAddedTo:(UIView *)inView;


/**
 显示圆饼

 @param inView 承载view
 @param isShowShade 是否显示遮罩层
 */
+ (void)showSMCakeAddedTo:(UIView *)inView isShowShade:(BOOL)isShowShade;



/**
 圆饼+文字

 @param inView 承载view
 @param title 提示语
 */
+ (void)showSMCakeAddedTo:(UIView *)inView withTitle:(NSString *)title;


/**
 圆饼+文字

 @param inView 承载view
 @param title 提示语
 @param isShowShade 是否显示遮罩层
 */
+ (void)showSMCakeAddedTo:(UIView *)inView withTitle:(NSString *)title isShowShade:(BOOL)isShowShade;


/**
 显示动画，animation

 @param inView 承载view
 @param imageArray 图片数组
 @param mode 动画类型
 */
+ (void)showSMAnimationAddedTo:(UIView *)inView withImageArray:(NSArray *)imageArray animationMode:(SMFrameAnimationMode)mode;


/**
 显示动画，animation

 @param inView 承载view
 @param imageArray 图片数组
 @param isShowShade 是否显示遮罩层
 @param mode 动画类型
 */
+ (void)showSMAnimationAddedTo:(UIView *)inView withImageArray:(NSArray *)imageArray isShowShade:(BOOL)isShowShade animationMode:(SMFrameAnimationMode)mode;



/**
 动画+文字

 @param inView 承载view
 @param imageArray 图片数组
 @param title 提示语
 @param mode 动画类型
 */
+ (void)showSMAnimationAddedTo:(UIView *)inView withImageArray:(NSArray *)imageArray withTitle:(NSString *)title animationMode:(SMFrameAnimationMode)mode;


/**
 动画+文字

 @param inView 承载view
 @param imageArray 图片数组
 @param title 提示语
 @param isShowShade 是否显示遮罩层
 @param mode 动画类型
 */
+ (void)showSMAnimationAddedTo:(UIView *)inView withImageArray:(NSArray *)imageArray withTitle:(NSString *)title isShowShade:(BOOL)isShowShade animationMode:(SMFrameAnimationMode)mode;




#pragma mark- 短时间消失

/**
 显示icon

 @param view 承载view
 @param icon 图片名字
 */
+ (void)showSMToastAddedTo:(UIView *)view Icon:(NSString *)icon;



/**
 显示icon

 @param view 承载view
 @param icon 图片名字
 @param isShowShade 是否显示遮罩层
 */
+ (void)showSMToastAddedTo:(UIView *)view Icon:(NSString *)icon isShowShade:(BOOL)isShowShade;



/**
 显示icon + 文字

 @param view 承载view
 @param icon 图片名字
 @param title 提示语
 */
+ (void)showSMToastAddedTo:(UIView *)view Icon:(NSString *)icon withTitle:(NSString *)title;



/**
 显示iCon + 文字

 @param view 承载view
 @param icon 图片名字
 @param title 提示语
 @param isShowShade 是否显示遮罩层
 */
+ (void)showSMToastAddedTo:(UIView *)view Icon:(NSString *)icon withTitle:(NSString *)title isShowShade:(BOOL)isShowShade;


/**
 显示提示语

 @param view 承载view
 @param message 提示语
 */
+ (void)showSMToastAddedTo:(UIView *)view Message:(NSString *)message;



/**
 显示提示语

 @param view 承载view
 @param message 提示语
 @param isShowShade 是否显示遮罩
 */
+ (void)showSMToastAddedTo:(UIView *)view Message:(NSString *)message isShowShade:(BOOL)isShowShade;


/**
 配置toast提示框

 @param view 承载view
 @param message 提示语
 @param titleColor 提示语颜色
 @param bgColor 背景颜色
 @param cornerRadius 圆角值
 @param alphaValue 透明度值
 @param loaction 位置
 @param isShowShade 是否显示遮罩
 @return mbManger对象
 */

+ (SummitManager *)showSMToastAddedTo:(UIView *)view Message:(NSString *)message titleColor:(UIColor *)titleColor bgColor:(UIColor *)bgColor cornerRadius:(NSNumber *)cornerRadius alphaValue:(NSNumber *)alphaValue loaction:(NSInteger)loaction isShowShade:(BOOL)isShowShade;


#pragma mark- 移除方法


/**
 移除HUD

 @param inView 父视图
 */
+ (void)hideSMHUDFromView:(UIView *)inView;



/**
 重置HUD的个数和显示状态

 @param inView 父视图
 */
+ (void)resetSMHUDFromView:(UIView *)inView;

@end

NS_ASSUME_NONNULL_END
