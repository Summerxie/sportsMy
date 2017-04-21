//
//  trackModel.h
//  sportsMy
//
//  Created by Summer on 17/4/21.
//  Copyright © 2017年 omychic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MAMapKit/MAMapKit.h>

@interface trackModel : NSObject

@property(nonatomic, strong) CLLocation *sourceLoc;

- (MAPolyline *)appedPolylineWithDestLoc: (CLLocation *)destLoc;

@end
