//
//  Mypolyline.m
//  sportsMy
//
//  Created by Summer on 17/4/22.
//  Copyright © 2017年 omychic. All rights reserved.
//

#import "Mypolyline.h"

@implementation Mypolyline

+ (instancetype)polylineWithSourceLocation:(CLLocation *)source andDestLocation:(CLLocation *)dest{
    
    CLLocationCoordinate2D polylineCoordinats[2];
    
    polylineCoordinats[0].latitude = source.coordinate.latitude;
    polylineCoordinats[0].longitude = source.coordinate.longitude;
    //终点
    polylineCoordinats[1].latitude = dest.coordinate.latitude;
    polylineCoordinats[1].longitude = dest.coordinate.longitude;

    
    Mypolyline *polyline = [Mypolyline polylineWithCoordinates:polylineCoordinats count:2];
    
    polyline.speed = source.speed + dest.speed *0.5 * 3.6;
    
    polyline.color = [UIColor colorWithRed:polyline.speed * 0.033 green:1 blue:0 alpha:1];
    
    return polyline;
    
}


@end
