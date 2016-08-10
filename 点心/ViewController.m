//
//  ViewController.m
//  点心
//
//  Created by 赵腾飞 on 2016/7/15.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ViewController.h"
#import "DMHeartFlyView.h"
@interface ViewController ()

@property (nonatomic,assign)CGFloat heartSize;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(self.view.bounds.size.width/2-50, [UIScreen mainScreen].bounds.size.height - 36 - 10, 100, 36);
    
//    [btn setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
    [btn setTitle:@"click" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(showLove:) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.shadowColor = [UIColor blackColor].CGColor;
    btn.layer.shadowOffset = CGSizeMake(0, 0);
    btn.layer.shadowOpacity = 0.5;
    btn.layer.shadowRadius = 1;
    btn.adjustsImageWhenHighlighted = NO;
    [self.view addSubview:btn];
    
}

- (void)showLove:(UIButton *)sender{
    _heartSize = 36;
    
    DMHeartFlyView *heart = [[DMHeartFlyView alloc]initWithFrame:CGRectMake(0, 0, 120, 100)];
    
    //(0, 0, _heartSize, _heartSize)
    [self.view addSubview:heart];
    CGPoint fountainSource = CGPointMake(self.view.bounds.size.width/2 + _heartSize/2.0, self.view.bounds.size.height-36);
    //(_heartSize + _heartSize/2.0, self.view.bounds.size.height - _heartSize/2.0-10)
    heart.center = fountainSource;
    [heart animateInView:self.view];
    
    //button 点击动画
    
    CAKeyframeAnimation *btnAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    btnAnimation.values = @[@(1.0),@(0.7),@(0.5),@(0.3),@(0.5),@(0.7),@(1.0),@(1.2),@(1.4),@(1.2),@(1.0)];
    btnAnimation.keyTimes = @[@(0.0),@(0.1),@(0.2),@(0.3),@(0.4),@(0.5),@(0.6),@(0.7),@(0.8),@(0.9),@(1.0)];
    btnAnimation.calculationMode = kCAAnimationLinear;
    btnAnimation.duration = 0.3;
    
    [sender.layer addAnimation:btnAnimation forKey:@"SHOW"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
