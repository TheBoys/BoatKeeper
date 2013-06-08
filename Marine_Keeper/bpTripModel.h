//
//  bpTripModel.h
//  Marine_Keeper
//
//  Created by Alejo on 7/06/13.
//  Copyright (c) 2013 TheBoys. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface bpTripModel : NSObject <CLLocationManagerDelegate>

- (void)startTrip;
- (void)stopTrip;

@end
