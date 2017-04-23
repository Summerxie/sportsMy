//
//  MainViewController.m
//  sportsMy
//
//  Created by Summer on 17/4/21.
//  Copyright © 2017年 omychic. All rights reserved.
//

#import "MainViewController.h"
#import "myTrackController.h"
#import "trackModel.h"
#import "mainSportController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)trackClick:(UIButton *)sender {
    
    trackModel *track = [[trackModel alloc] initWithSportsType:sender.tag];

//    myTrackController *vc = [[myTrackController alloc] init];
    
    mainSportController *vc = [[mainSportController alloc]  init];
    
    vc.track = track;
    
    [self presentViewController:vc animated:YES completion:nil];
    
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
