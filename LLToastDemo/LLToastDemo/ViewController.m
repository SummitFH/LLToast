//
//  ViewController.m
//  LLToastDemo
//
//  Created by Summit的Macmini on 2020/1/14.
//  Copyright © 2020 Summit的Macmini. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import <SummitManager.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSMutableArray<NSArray<NSString *> *> *actionList;    //数据数组

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor yellowColor];
    [self setupMainView];
    
}

- (void)setupMainView{
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.view addSubview:self.myTableView];
    self.myTableView.tableFooterView = [UIView new];
    
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.right.mas_equalTo(0);
    }];

    [self configureData];
}

- (void)configureData{
    self.actionList = [NSMutableArray new];
    [self.actionList addObject:@[@"toast",@"showToast"]];
    [self.actionList addObject:@[@"toast无遮罩",@"showToastWithoutShade"]];
    [self.actionList addObject:@[@"toastIcon",@"showToastIcon"]];
    [self.actionList addObject:@[@"toastIcon+文字",@"showToastIconWithTitle"]];
    [self.actionList addObject:@[@"菊花loading",@"showLoading"]];
    [self.actionList addObject:@[@"菊花loading无遮罩",@"showLoadingWithoutShade"]];
    [self.actionList addObject:@[@"菊花loading+文字",@"showLoadingWithTitle"]];
    [self.actionList addObject:@[@"圆饼loading",@"showLoadingCake"]];
    [self.actionList addObject:@[@"圆环loading",@"showLoadingAnnular"]];
    [self.actionList addObject:@[@"帧动画（传入图片数组）",@"FrameAnimation"]];
    [self.actionList addObject:@[@"旋转动画（传入图片数组）",@"RotaeAnimation"]];
    [self.actionList addObject:@[@"并发请求",@"AsyncRequest"]];
    
    
    //设置颜色
    [[SummitManager shareInstance] setTitleColor:[UIColor whiteColor]];
    [[SummitManager shareInstance] setSMCornerRadius:@"6"];
    [[SummitManager shareInstance] setActivityIndicatorColor:[UIColor greenColor]];
}

- (void)showAnimation{
    
    CALayer *layer = [CALayer new];
    layer.frame = CGRectMake(100, 100, 100, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer: layer];
    
    CABasicAnimation *animation  = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.duration = 2;
    
    animation.fromValue = [NSValue valueWithCGPoint:layer.position];
    
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 300)];
    //延时 1.0秒
    animation.beginTime = CACurrentMediaTime() + 1.0;
    // 指定动画重复是否累加
    animation.cumulative = NO;
    // 动画完成是否移除动画
    animation.removedOnCompletion = YES;
    // 设置移动的效果为快入快出
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    // 设置无限循环动画
    animation.repeatCount = HUGE_VALF;
    // 设置动画完成时，自动以动画回到原点
    animation.autoreverses = YES;
    // 设置动画完成时，返回到原点
    animation.fillMode = kCAFillModeForwards;
    
    [layer addAnimation:animation forKey:nil];
}


#pragma mark- UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _actionList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"CELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = _actionList[indexPath.row][0];
    return cell;
}



#pragma mark- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //    [self showAnimation];
    //    return;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //获取方法
    SEL functionSel = NSSelectorFromString(self.actionList[indexPath.row][1]);
    if (functionSel) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:functionSel];
#pragma clang diagnostic pop
    }

}

#pragma mark- function


- (void)showToast{
    [SummitManager showSMToastAddedTo:self.view Message:@"有遮罩"];
}

- (void)showToastWithoutShade{
//    [SummitManager showSMToastAddedTo:self.mainTableView Message:@"无遮罩" isShowShade:NO];
     SummitManager *mb = [SummitManager showSMToastAddedTo:self.myTableView Message:@"wuzhezhao" titleColor:[UIColor greenColor] bgColor:[UIColor orangeColor] cornerRadius:[NSNumber numberWithFloat:2] alphaValue:[NSNumber numberWithFloat:1] loaction:SMMBHUDLocationBottom isShowShade:YES];
    mb.smHud.bezelView.backgroundColor = [UIColor grayColor];
}

- (void)showToastIcon{
    [SummitManager showSMToastAddedTo:self.view Icon:@"success"];
}

- (void)showToastIconWithTitle{
    [SummitManager showSMToastAddedTo:self.myTableView Icon:@"fail" withTitle:@"失败" isShowShade:NO];
}

- (void)showLoading{
    [self showMBHUD:YES mode:SMMBHUDModeIndeterminate];
}

- (void)showLoadingWithoutShade{
    [self showMBHUD:NO mode:SMMBHUDModeIndeterminate];
}
- (void)showLoadingWithTitle{
    [self showMBHUD:NO mode:SMMBHUDModeOnlyText];
}

- (void)showLoadingCake{
    [self showMBHUD:YES mode:SMMBHUDModeDeterminate];
}

- (void)showLoadingAnnular{
    [self showMBHUD:NO mode:SMMBHUDModeAnnularDeterminate];
}

- (void)FrameAnimation{
    [self showCustomAnimaiton:SMFrameAnimationModeFrame];
}

- (void)RotaeAnimation{
    [self showCustomAnimaiton:SMFrameAnimationModeCircle];
}


- (void)AsyncRequest{
    
    [self showMBHUD:NO mode:SMMBHUDModeIndeterminate];
    
}

//菊花
- (void)showMBHUD:(BOOL)isShowShade mode:(SMMBHUDMode)mode{
    
    switch (mode) {
        case SMMBHUDModeIndeterminate:
            [SummitManager showSMHUDAddedTo:self.view isShowShade:isShowShade];
            break;
            
        case SMMBHUDModeDeterminate:
            [SummitManager showSMCakeAddedTo:self.view isShowShade:isShowShade];
            break;
            
        case SMMBHUDModeAnnularDeterminate:
            [SummitManager showSMAnnularAddedTo:self.view isShowShade:isShowShade];
            break;
            
        case SMMBHUDModeOnlyText:
//            [SummitManager showSMHUDAddedTo:self.view withTitle:@"加载中……" isShowShade:isShowShade];
            [SummitManager showSMHudAddedTo:self.view withTitle:@"Loading......" titleColor:[UIColor yellowColor] bgColor:[UIColor redColor] cornerRadius:[NSNumber numberWithFloat:10] alphaValue:[NSNumber numberWithFloat:0.5] isShowShade:YES];
            break;
            
        default:
            break;
    }
    
    int duration = 3 + arc4random() % 10;
    NSLog(@"request---------  %d  -----",duration);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        sleep(duration);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [SummitManager hideSMHUDFromView:self.view];

        });
        
    });
}


- (void)showCustomAnimaiton:(SMFrameAnimationMode)mode{
    
    NSMutableArray *imageArr = [NSMutableArray new];
    
    //帧动画
    
    
    switch (mode) {
        case SMFrameAnimationModeFrame:
        {
            for (int i = 0; i<4; i++) {
                NSString *imgName = [NSString stringWithFormat:@"%d.png",(int)(i+1)];
                //                NSString *imgName = [NSString stringWithFormat:@"ip_%d_34x34_.png",(int)(i+1)];
                [imageArr addObject:[UIImage imageNamed:imgName]];
            }
            [SummitManager showSMAnimationAddedTo:self.view withImageArray:imageArr animationMode:mode];
        }
            break;
        case SMFrameAnimationModeCircle:
        {
            //旋转动画
            for (int i = 0; i<12; i++) {
                //                NSString *imgName = [NSString stringWithFormat:@"ip_%d_34x34_.png",(int)(i+1)];
                [imageArr addObject:[UIImage imageNamed:@"ps_refresh_circle_34x34_"]];
            }
            [SummitManager showSMAnimationAddedTo:self.view withImageArray:imageArr animationMode:mode];
            
        }
            break;
        case SMFrameAnimationModeSwitch:
        {
            
        }
            break;
            
        default:
            break;
    }
    
    
    int duration = 3 + arc4random() % 10;
    NSLog(@"request---------  %d  -----",duration);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        sleep(duration);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [SummitManager hideSMHUDFromView:self.view];
        });
        
    });
    
    
    
}


@end
