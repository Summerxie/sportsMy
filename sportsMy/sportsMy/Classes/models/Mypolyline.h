//
//  Mypolyline.h
//  sportsMy
//
//  Created by Summer on 17/4/22.
//  Copyright © 2017年 omychic. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>

@interface Mypolyline : MAPolyline

@property(nonatomic, assign) CGFloat speed;
@property(nonatomic, strong) UIColor *color;

+ (instancetype)polylineWithSourceLocation:(CLLocation *)source andDestLocation:(CLLocation *)dest;

@end
