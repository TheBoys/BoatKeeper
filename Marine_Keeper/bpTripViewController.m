//
//  bpTripsViewController.m
//  Marine_Keeper
//
//  Created by Alejo Alvarez on 02/06/13.
//  Copyright (c) 2013 TheBoys. All rights reserved.
//

#import "bpTripViewController.h"


@interface bpTripViewController ()

@property (nonatomic, strong) CLLocationManager *myLocationManager;
@property (nonatomic, strong) CLLocation *lastLocation;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) NSMutableArray *locations;
@property (nonatomic, strong) NSMutableArray *points;

@end

@implementation bpTripViewController

@synthesize myLocationManager = _myLocationManager;
@synthesize lastLocation = _lastLocation;
@synthesize coordinate = _coordinate;
@synthesize locations = _locations;
@synthesize points = _points;
@synthesize displayLatitude = _displayLatitude;
@synthesize displayLongitude = _displayLongitude;

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    _lastLocation = [locations lastObject];
    [_points addObject:[locations lastObject]];
    
    NSLog(@"Latitude=%f",_lastLocation.coordinate.latitude);
    NSLog(@"Longitude=%f",_lastLocation.coordinate.longitude);
    
    self.displayLatitude.text = [NSString stringWithFormat:@"%f", _lastLocation.coordinate.latitude];
    self.displayLongitude.text = [NSString stringWithFormat:@"%f", _lastLocation.coordinate.longitude];
    
    NSNumber *latitude = [NSNumber numberWithDouble:_lastLocation.coordinate.latitude];
    NSString *latitudeString = [NSString stringWithFormat:@"%f",[latitude doubleValue]];
    NSNumber *longitude = [NSNumber numberWithDouble:_lastLocation.coordinate.longitude];
    NSString *longitudeString = [NSString stringWithFormat:@"%f",[longitude doubleValue]];
    
    NSArray *coordinate = [NSArray arrayWithObjects:latitudeString, longitudeString, nil];
    [_locations addObject:coordinate];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _locations = [NSMutableArray array];
    _points = [NSMutableArray array];
    if ([CLLocationManager locationServicesEnabled]) {
        self.myLocationManager = [[CLLocationManager alloc]init];
        
        self.myLocationManager.delegate = self;
        
        [self.myLocationManager startUpdatingLocation];
    }else{
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Location" message:@"Location services disabled. You need to enable them in the settings" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stopNavigation:(UIButton *)sender {
    [self.myLocationManager stopUpdatingLocation];
    //NSLog(@"Latitude after stop=%f",_lastLocation.coordinate.latitude);
    //NSLog(@"Longitud after stop=%f",_lastLocation.coordinate.longitude);
    _coordinate.latitude = _lastLocation.coordinate.latitude;
    _coordinate.longitude = _lastLocation.coordinate.longitude;
    //NSLog(@"count objects in locations array: %u", [_locations count]);
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:_locations options:NSJSONWritingPrettyPrinted error:&error];
    if([jsonData length] > 0 && error == nil){
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"jSon string with coordinates: %@", jsonString);
    }
    
    // Send post request to web service
    NSString *urlAsString = @"http://localhost/testNavigation.php";
    NSURL *url = [NSURL URLWithString:urlAsString];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    //[urlRequest se]
    [urlRequest setHTTPBody:jsonData];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
        if ([data length] > 0 && error == nil) {
            NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"html = %@", html);
        }
    }];
}

@end