//
//  bpTripsViewController.h
//  Marine_Keeper
//
//  Created by Alejo Alvarez on 02/06/13.
//  Copyright (c) 2013 TheBoys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "bpTripModel.h"

@interface bpTripViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UILabel *displayLatitude;
@property (weak, nonatomic) IBOutlet UILabel *displayLongitude;
@property (weak, nonatomic) IBOutlet UILabel *displaySpeed;

@end
