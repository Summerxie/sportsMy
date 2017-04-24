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
#import "Mypolyline.h"



@interface MapViewController () <MAMapViewDelegate>

@property(nonatomic, strong) Mypolyline *polyline;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     [AMapServices sharedServices].enableHTTPS = YES;

    _mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:_mapView];
    
    [self setupMapview];
    
}


-(instancetype)initWithSportsType: (sportType)sportType{
    
    self = [super init];
    
    
    if (self){
       
        self.track = [[trackModel alloc] initWithSportsType:sportType AndSportState:self.track.mySportState];

    }
    
    return self;
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
        polylineRenderer.strokeColor  = self.polyline.color;
        
        polylineRenderer.lineJoinType = kMALineJoinRound;
        polylineRenderer.lineCapType  = kMALineCapRound;
        
        return polylineRenderer;
    }
    
    return nil;
}


-(MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    
    if ([annotation isKindOfClass:[MAPointAnnotation class]]) {
       static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
        
        MAPinAnnotationView*annotationView = (MAPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
        if (annotationView == nil)
        {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
        }
        annotationView.canShowCallout= YES;       //设置气泡可以弹出，默认为NO
        annotationView.animatesDrop = YES;        //设置标注动画显示，默认为NO
        annotationView.draggable = YES;
        annotationView.image = [UIImage imageNamed:self.track.sportsImgName];
        
        //设置标注可以拖动，默认为NO
//        annotationView.pinColor = MAPinAnnotationColorPurple;
        return annotationView;
    }
    return nil;
    
}

-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation
{
    
    if (updatingLocation == NO) {
        return;
    }
    
    _mapView.centerCoordinate = userLocation.location.coordinate;
    
    Mypolyline *polyline = [self.track appedPolylineWithDestLoc:userLocation.location];
    
    self.polyline = polyline;
    
    self.track.sourceLoc = userLocation.location;

    [_mapView addOverlay:polyline];
    
    if (self.track.anno == nil) {
        self.track.anno = [[MAPointAnnotation alloc] init];
        self.track.anno.coordinate = userLocation.location.coordinate;
        self.track.anno.title = userLocation.title;
        self.track.anno.subtitle = userLocation.subtitle;
    
         [_mapView addAnnotation:self.track.anno];
    }
    
   
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



@end
