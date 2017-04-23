//
//  myTrackController.m
//  sportsMy
//
//  Created by Summer on 17/4/21.
//  Copyright © 2017年 omychic. All rights reserved.
//

#import "myTrackController.h"


@interface myTrackController ()

@property (weak, nonatomic) IBOutlet UIView *trackView;

@end

@implementation myTrackController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(instancetype)init
{
    
    if (self = [super init]) {
        
        MapViewController *mapViewVc = [[MapViewController alloc] initWithSportsType:self.track.mySportType];
        [self addChildViewController:mapViewVc];
        
        [self.view addSubview:mapViewVc.view];
        
        mapViewVc.view.frame = self.trackView.bounds;
        

    }
    
    return self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
