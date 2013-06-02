//
//  bpSearchViewController.m
//  Marine_Keeper
//
//  Created by Simon Peacock on 4/05/13.
//  Copyright (c) 2013 TheBoys. All rights reserved.


#import "bpSearchViewController.h"

@interface bpSearchViewController ()

@end

@implementation bpSearchViewController

- (BOOL)textFieldShouldReturn:(UITextField*) txtRegoNumber {
    NSLog(@" This should print in log with textField entry of - %@", txtRegoNumber.text);
    NSLog(@" *** About to call searchForBoat");
    
    
    NSString *urlAsString = @"http://pixolity.com/post.php";
    urlAsString = [urlAsString stringByAppendingString:@"?param1=First"];
    urlAsString = [urlAsString stringByAppendingString:@"&param2=Second"];
    
    NSURL *URL = [NSURL URLWithString: urlAsString];
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:URL];
    [urlRequest setTimeoutInterval:30.0f];
    [urlRequest setHTTPMethod:@"POST"];
    
    NSString *body = @"bodyParam1=BodyValue1&bodyParam2=BodyValue2";
    [urlRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if ([data length] >0 && error == nil){
            NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"HTML = %@", html);
        }
        else if ([data length] == 0 && error == nil) {
            NSLog(@"Nothing was downloaded.");
        }
        else if (error != nil) {
            NSLog(@"Error happened = %@", error);
        }
    }];
    
    
    
    
    NSLog(@" *** About to call searchForBoat");
    return TRUE;
}

- (void) searchForBoat {

 
}

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

@end