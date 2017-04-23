//
//  MapViewController.h
//  sportsMy
//
//  Created by Summer on 17/4/21.
//  Copyright © 2017年 omychic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
#import "trackModel.h"


@interface MapViewController : UIViewController

@property(nonatomic, strong ,readonly)MAMapView *mapView;
@property(nonatomic, strong) trackModel *track;
//@property(nonatomic, strong) CLLocation *sourceLoc;
//@property(nonatomic, assign) sportType mySportType;
//@property(nonatomic, copy) NSString *sportsImgName;

-(instancetype)initWithSportsType: (sportType)sportType;



@end
