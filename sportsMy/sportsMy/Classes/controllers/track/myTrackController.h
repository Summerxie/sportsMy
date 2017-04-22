//
//  myTrackController.h
//  sportsMy
//
//  Created by Summer on 17/4/21.
//  Copyright © 2017年 omychic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapViewController.h"

@interface myTrackController : UIViewController
@property(nonatomic, assign) sportType mySportType;
@property(nonatomic, copy) NSString *sportsImgName;


-(instancetype)initWithSportsType: (sportType)sportType;

@end
