//
//  trackModel.h
//  sportsMy
//
//  Created by Summer on 17/4/21.
//  Copyright © 2017年 omychic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MAMapKit/MAMapKit.h>
#import "Mypolyline.h"

typedef enum : NSUInteger{
    sportTypeRun,
    sportTypeWalking,
    sportTypeRiding,
} sportType;

typedef enum : NSUInteger {
    sportStateContinue,
    sportStatePause,
    sportStateComplete,
} sportState;

@interface trackModel : NSObject

@property(nonatomic, strong) CLLocation *sourceLoc;
@property(nonatomic, assign) sportType mySportType;
@property(nonatomic, copy) NSString *sportsImgName;
@property(nonatomic, strong) MAPointAnnotation *anno;
@property(nonatomic,assign) sportState mySportState;



- (Mypolyline *)appedPolylineWithDestLoc: (CLLocation *)destLoc;

-(instancetype)initWithSportsType: (sportType)sportType AndSportState: (sportState)sportState;

@end
