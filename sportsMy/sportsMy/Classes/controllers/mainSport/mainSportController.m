//
//  mainSportController.m
//  sportsMy
//
//  Created by Summer on 17/4/23.
//  Copyright © 2017年 omychic. All rights reserved.
//

#import "mainSportController.h"
#import "myTrackController.h"


@interface mainSportController ()

@property(nonatomic, strong) myTrackController *trackVc;

@end

@implementation mainSportController

- (IBAction)stateBtnClick:(UIButton *)sender {
    
    self.track.mySportState = sender.tag;
    
    self.trackVc.track = self.track;
}

- (IBAction)trackBtn:(UIButton *)sender {
    
    [self presentViewController:self.trackVc animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //强引用，以免trackVc释放。注意位置只能是在viewDidLoad里，不能在响应事件里面
    self.trackVc = [[myTrackController alloc] init];
    
    self.trackVc.track = self.track;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
