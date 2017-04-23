//
//  ViewController.m
//  testtransfer
//
//  Created by Summer on 17/4/23.
//  Copyright © 2017年 omychic. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //形状图层
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    layer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake([UIScreen mainScreen].bounds.size.width - 50 - 50, 50, 50, 50)].CGPath;
    
//    layer.fillColor = [UIColor redColor].CGColor;
//    
//    [self.view.layer addSublayer:layer];
    
    
    //同心圆，矩形缩放半径  重点：中心点不变，正值缩小，负值放大
    CGRectInset(CGRectZero, 10, 10);
    
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    CGFloat h = [UIScreen mainScreen].bounds.size.height;
    
    
    //放大后同心圆的半径， 勾股定理，求出放大后圆的半径，确保屏幕放到圆中
    CGFloat r = sqrt(w * w + h * h);
    
    
    self.view.layer.mask = layer;
    
   // 对layer 设置动画必须使用CA动画，不能使用UIView的动画
    
    CAAnimation ani = [CAAnimation ]
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
