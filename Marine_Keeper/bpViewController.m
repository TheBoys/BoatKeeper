//
//  bpViewController.m
//  Marine_Keeper
//
//  Created by Simon Peacock on 4/05/13.
//  Copyright (c) 2013 TheBoys. All rights reserved.
//

#import "bpViewController.h"

@interface bpViewController ()

@end

@implementation bpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startNavigation:(UIButton *)sender {
//    _locations = [NSMutableArray array];
//    _points = [NSMutableArray array];
//    if ([CLLocationManager locationServicesEnabled]) {
//        self.myLocationManager = [[CLLocationManager alloc]init];
        
//        self.myLocationManager.delegate = self;
        
//        [self.myLocationManager startUpdatingLocation];
//    }else{
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Location" message:@"Location services disabled. You need to enable them in the settings" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
//}

@end
