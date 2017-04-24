//
//  Animator.h
//  sportsMy
//
//  Created by Summer on 17/4/24.
//  Copyright © 2017年 omychic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Animator : NSObject <UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>

@property(nonatomic, strong) id<UIViewControllerContextTransitioning> transitionContext;

@end
