//
//  Animator.m
//  sportsMy
//
//  Created by Summer on 17/4/24.
//  Copyright © 2017年 omychic. All rights reserved.
//

#import "Animator.h"

@implementation Animator

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self;
}


-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0f;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:toView];
    toView.frame = containerView.bounds;
    
    [self customAnimInView:toView];
    
    [transitionContext completeTransition:YES];
}


- (void)customAnimInView:(UIView *)view{
    
    //创建形状图层
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    //起始位置
    CGFloat topMargin = 33;
    CGFloat rightMargin = 21;
    CGFloat radius = 15;
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    CGRect soucreRect = CGRectMake(screenW - rightMargin - 2 * radius, topMargin, 2 * radius, 2 * radius);
    CGPathRef sourcePath = [UIBezierPath bezierPathWithOvalInRect:soucreRect].CGPath;
    
    //结束位置  半径^2 = screenW^2 + screenH^2
    //使用屏幕的斜边长度作为结束位置的半径
    CGFloat endRadius = sqrt((screenW * screenW) + (screenH * screenH));
    
    //用于对尺寸进行缩放,中心点不变  CGRectInset(原始尺寸, x方向缩小的维度, y方向缩小的维度) 正值缩小,负值放大
    CGRect endRect = CGRectInset(soucreRect, -endRadius, -endRadius);
    //设置形状
    
    CGPathRef endPath = [UIBezierPath bezierPathWithOvalInRect:endRect].CGPath;
    //    shapeLayer.path = endPath;
    //设置遮罩
    view.layer.mask = shapeLayer;
    
    //对layer设置属性动画,必须使用CA动画,不能使用UIView的块动画
    //创建基础动画
    CABasicAnimation *basicAnim = [CABasicAnimation animationWithKeyPath:@"path"];
    //设置动画始末值
//    if (_hasPresented) { //解除动画
//        
//        basicAnim.toValue = (__bridge id _Nullable)(sourcePath);
//        basicAnim.fromValue = (__bridge id _Nullable)(endPath);
//        
//        
//    }else { //展示动画
//        
        basicAnim.fromValue = (__bridge id _Nullable)(sourcePath);
        basicAnim.toValue = (__bridge id _Nullable)(endPath);
//    }
    //设置时长
    basicAnim.duration = [self transitionDuration:_transitionContext];
    //保留动画最终的内容
    basicAnim.removedOnCompletion = NO;
    basicAnim.fillMode = kCAFillModeForwards;
    //设置动画代理 监听动画执行的情况
//    basicAnim.delegate = self;
    //添加动画  设置改变哪个对象的属性,就将动画添加到哪个对象上
    [shapeLayer addAnimation:basicAnim forKey:nil];
    
    
}


@end
