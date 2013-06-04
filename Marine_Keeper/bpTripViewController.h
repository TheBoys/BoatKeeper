//
//  bpTripsViewController.h
//  Marine_Keeper
//
//  Created by Alejo Alvarez on 02/06/13.
//  Copyright (c) 2013 TheBoys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface bpTripViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *displayLatitude;
@property (weak, nonatomic) IBOutlet UILabel *displayLongitude;

@end
