//
//  MapViewController.m
//  sportsMy
//
//  Created by Summer on 17/4/21.
//  Copyright © 2017年 omychic. All rights reserved.
//

#import "MapViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import "trackModel.h"

@interface MapViewController () <MAMapViewDelegate>

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     [AMapServices sharedServices].enableHTTPS = YES;

    _mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:_mapView];
    
    [self setupMapview];
    
    
}

-(void)setupMapview
{
    _mapView.delegate = self;
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
    _mapView.rotateEnabled = NO;
    _mapView.allowsBackgroundLocationUpdates = YES;
    _mapView.pausesLocationUpdatesAutomatically = NO;
    
    
}

-(void)mapView:(MAMapView *)mapView didSingleTappedAtCoordinate:(CLLocationCoordinate2D)coordinate
{
    
    //构造折现数据对象
    CLLocationCoordinate2D polylineCoord[2];
    
    polylineCoord[0].latitude = _mapView.userLocation.location.coordinate.latitude;
    polylineCoord[0].longitude = _mapView.userLocation.location.coordinate.longitude;
;
    
    polylineCoord[1].latitude = coordinate.latitude;
    polylineCoord[1].longitude = coordinate.longitude;
    
    //构造折线对象
    MAPolyline *polyline = [MAPolyline polylineWithCoordinates:polylineCoord count:2];
    //在地图上添加折线对象
    [_mapView addOverlay:polyline];

}


-(MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id<MAOverlay>)overlay
{
    
    if ([overlay isKindOfClass:[MAPolyline class]])
    {
        MAPolylineRenderer *polylineRenderer = [[MAPolylineRenderer alloc] initWithPolyline:overlay];
        
        polylineRenderer.lineWidth    = 8.f;
        polylineRenderer.strokeColor  = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.6];
        polylineRenderer.lineJoinType = kMALineJoinRound;
        polylineRenderer.lineCapType  = kMALineCapRound;
        
        return polylineRenderer;
    }
    
    return nil;
}


-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation
{
    
    if (updatingLocation == NO) {
        return;
    }
    

    
//    MAPolyline *polyline = [self.track appedPolylineWithDestLoc:userLocation.location];
    
    if (self.sourceLoc == nil) {
        
        self.sourceLoc = userLocation.location;
       
    }
    
    else
    {
    CLLocationCoordinate2D polyLineCoordinates[2];
    
    polyLineCoordinates[0].latitude = _sourceLoc.coordinate.latitude;
    polyLineCoordinates[0].longitude = _sourceLoc.coordinate.longitude;
    
    polyLineCoordinates[1].latitude = userLocation.location.coordinate.latitude;
    polyLineCoordinates[1].longitude = userLocation.location.coordinate.longitude;
    
    MAPolyline *polyline = [MAPolyline polylineWithCoordinates:polyLineCoordinates count:2];
    
    _sourceLoc = userLocation.location;

    
    [_mapView addOverlay:polyline];
        
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



@end
