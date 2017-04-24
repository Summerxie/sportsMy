//
//  myTrackController.m
//  sportsMy
//
//  Created by Summer on 17/4/21.
//  Copyright © 2017年 omychic. All rights reserved.
//

#import "myTrackController.h"
#import "Animator.h"


@interface myTrackController ()

@property (weak, nonatomic) IBOutlet UIView *trackView;
@property(nonatomic, strong) MapViewController *mapVc;
@property(nonatomic,strong) Animator *animator;

@end

@implementation myTrackController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(instancetype)init
{
    
    if (self = [super init]) {
        
        [self setupMapView];
        
        self.modalPresentationStyle = UIModalPresentationCustom;
        
        self.animator = [[Animator alloc] init];
        
        self.transitioningDelegate = self.animator;
        
    
        

    }
    
    return self;
}

-(void)setupMapView{
    
    MapViewController *mapViewVc = [[MapViewController alloc] initWithSportsType:self.track.mySportType];
    
    self.mapVc = mapViewVc;
    
    [self addChildViewController:mapViewVc];
    
    [self.view addSubview:mapViewVc.view];
    
    mapViewVc.view.frame = self.view.bounds;

}

-(void)setTrack:(trackModel *)track
{
    _track = track;
    self.mapVc.track = track;
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
