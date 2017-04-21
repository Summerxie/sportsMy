//
//  myTrackController.m
//  sportsMy
//
//  Created by Summer on 17/4/21.
//  Copyright © 2017年 omychic. All rights reserved.
//

#import "myTrackController.h"
#import "MapViewController.h"

@interface myTrackController ()
@property (weak, nonatomic) IBOutlet UIView *trackView;

@end

@implementation myTrackController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MapViewController *mapViewVc = [[MapViewController alloc] init];
    
    [self addChildViewController:mapViewVc];
    
    [self.view addSubview:mapViewVc.view];
    
    mapViewVc.view.frame = self.trackView.bounds;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
