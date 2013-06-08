//
//  bpTripsViewController.m
//  Marine_Keeper
//
//  Created by Alejo Alvarez on 02/06/13.
//  Copyright (c) 2013 TheBoys. All rights reserved.
//

#import "bpTripViewController.h"

@interface bpTripViewController()
@property (nonatomic, strong) bpTripModel *tripModel;
@end

@implementation bpTripViewController

@synthesize displayLatitude = _displayLatitude;
@synthesize displayLongitude = _displayLongitude;
@synthesize tripModel = _tripModel;

//self.displayLatitude.text = [NSString stringWithFormat:@"%f", _lastLocation.coordinate.latitude];
//self.displayLongitude.text = [NSString stringWithFormat:@"%f", _lastLocation.coordinate.longitude];

- (bpTripModel *)tripModel {
    if (!_tripModel) _tripModel = [[bpTripModel alloc] init];
    return _tripModel;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.tripModel startTrip];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stopNavigation:(UIButton *)sender {
    [self.tripModel stopTrip];
}

@end