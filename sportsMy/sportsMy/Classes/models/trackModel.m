//
//  trackModel.m
//  sportsMy
//
//  Created by Summer on 17/4/21.
//  Copyright © 2017年 omychic. All rights reserved.
//

#import "trackModel.h"

@implementation trackModel

-(instancetype)initWithSportsType: (sportType)sportType{
    self = [super init];
    
    _mySportType = sportType;
    
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


- (MAPolyline *)appedPolylineWithDestLoc: (CLLocation *)destLoc
{
    if (self.sourceLoc == nil) {
        
        self.sourceLoc = destLoc;
        return nil;
    }
    
    CLLocationCoordinate2D polyLineCoordinates[2];
    
    polyLineCoordinates[0].latitude = _sourceLoc.coordinate.latitude;
    polyLineCoordinates[0].longitude = _sourceLoc.coordinate.longitude;
    
    polyLineCoordinates[1].latitude = destLoc.coordinate.latitude;
    polyLineCoordinates[1].longitude = destLoc.coordinate.longitude;
    
    MAPolyline *polyline = [MAPolyline polylineWithCoordinates:polyLineCoordinates count:2];
    
    _sourceLoc = destLoc;
    
    return polyline;
}

@end
