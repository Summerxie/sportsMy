//
//  trackModel.h
//  sportsMy
//
//  Created by Summer on 17/4/21.
//  Copyright © 2017年 omychic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MAMapKit/MAMapKit.h>

typedef enum : NSUInteger{
    sportTypeRun,
    sportTypeWalking,
    sportTypeRiding,
} sportType;

@interface trackModel : NSObject

@property(nonatomic, strong) CLLocation *sourceLoc;
@property(nonatomic, assign) sportType mySportType;
@property(nonatomic, copy) NSString *sportsImgName;


- (MAPolyline *)appedPolylineWithDestLoc: (CLLocation *)destLoc;
-(instancetype)initWithSportsType: (sportType)sportType;

@end
