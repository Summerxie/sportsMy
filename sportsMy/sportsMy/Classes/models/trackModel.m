//
//  trackModel.m
//  sportsMy
//
//  Created by Summer on 17/4/21.
//  Copyright © 2017年 omychic. All rights reserved.
//

#import "trackModel.h"
#import "Mypolyline.h"

@implementation trackModel

-(instancetype)initWithSportsType: (sportType)sportType AndSportState: (sportState)sportState{
    self = [super init];
    
    _mySportType = sportType;
    _mySportState = sportState;
    
    if (self){
        
        switch (sportType) {
                
            case sportTypeRun:
                self.sportsImgName = @"map_annotation_run";
                break;
                
            case sportTypeWalking:
                self.sportsImgName = @"map_annotation_walk";
                break;
            case sportTypeRiding:
                self.sportsImgName = @"map_annotation_bike";
                break;
                
            default:
                break;
        }
    }
    
    return self;
}


- (Mypolyline *)appedPolylineWithDestLoc: (CLLocation *)destLoc
{
    
    if (self.mySportState != sportStateContinue) {
        return nil;
    }
    
    if (self.sourceLoc == nil) {
        
        self.sourceLoc = destLoc;
        return nil;
    }
    
    if (destLoc.speed <= 0) {
        
        return nil;
    }
    
    //排除已经"过期"的定位数据  计算当前时间和定位时间戳的差值  2秒以内的数据可用
    if ([[NSDate date] timeIntervalSinceDate:destLoc.timestamp] >= 2) {
        
        return nil;
    }

    
//    CLLocationCoordinate2D polyLineCoordinates[2];
//    
//    polyLineCoordinates[0].latitude = _sourceLoc.coordinate.latitude;
//    polyLineCoordinates[0].longitude = _sourceLoc.coordinate.longitude;
//    
//    polyLineCoordinates[1].latitude = destLoc.coordinate.latitude;
//    polyLineCoordinates[1].longitude = destLoc.coordinate.longitude;
    
    Mypolyline *polyline = [Mypolyline polylineWithSourceLocation:self.sourceLoc andDestLocation:destLoc];
    
    _sourceLoc = destLoc;
    
    return polyline;
}

@end
