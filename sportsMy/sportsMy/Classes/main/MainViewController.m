//
//  MainViewController.m
//  sportsMy
//
//  Created by Summer on 17/4/21.
//  Copyright © 2017年 omychic. All rights reserved.
//

#import "MainViewController.h"
#import "myTrackController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)trackClick:(UIButton *)sender {

    myTrackController *vc = [[myTrackController alloc] init];
    
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
