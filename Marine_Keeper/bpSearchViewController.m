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
    
    NSString *urlAsString = @"http://192.168.1.9/marine/indexMarine.php";
    urlAsString = [urlAsString stringByAppendingString:@"?REGO="];
    urlAsString = [urlAsString stringByAppendingString:txtRegoNumber.text];
    
    //urlAsString = [urlAsString stringByAppendingString:@"&param2=Second"];
    
    NSLog(@" URL being passed is - %@", urlAsString);
    
    NSURL *URL = [NSURL URLWithString: urlAsString];
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:URL];
    [urlRequest setTimeoutInterval:30.0f];
    [urlRequest setHTTPMethod:@"POST"];
    
    //NSString *body = @"bodyParam1=BodyValue1&bodyParam2=BodyValue2";
    //NSString *body = @"REGO=";
    //body = [body stringByAppendingString:txtRegoNumber.text];
    
    //NSLog(@"PARAMETER BEING PASSED IS %@", body);
    
    //[urlRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if ([data length] >0 && error == nil){
            
            NSString *returnSearch = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"RETURN as NSString = %@", returnSearch);
            
            id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            
            NSLog(@"data was succesfully de-sereialized");
            
            if ([jsonObject isKindOfClass:[NSDictionary class]]) {
                
                NSDictionary *deserializedDicationary = (NSDictionary *)jsonObject;
                NSLog(@"Deserialized JSON Dictionary = %@", deserializedDicationary);
                
            } else if ([jsonObject isKindOfClass:[NSArray class]]){
            
                NSArray *deserializedArray = (NSArray *)jsonObject;
                NSLog(@"Deserialized JSON Array = %@",deserializedArray);
                //_searchResults = deserializedArray;
                _searchResults = [NSString stringWithFormat:@"Received Data: %@", deserializedArray];
                
            } else {
                NSLog(@"Neither Dictionary or Array");
            }
            
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

- (id) objectInObject:(NSObject *) rootObject forPath:(NSString *) aKeyPath {
    
    NSArray *keys = [aKeyPath componentsSeparatedByString:@"."];
    NSObject *anObject = rootObject;
    
    
    for (NSString *aKey in keys) {
        int arrayIndex = 0;
        bool isArray = NO;
        
        // check array
        if ([[aKey substringToIndex:2] isEqualToString:@"i:"]) {
            isArray = YES;
            NSArray *values = [aKey componentsSeparatedByString:@":" ];
            arrayIndex = [[values objectAtIndex:1] intValue];
        }
        
        if (isArray) {
            anObject = [(NSArray *) anObject objectAtIndex:arrayIndex];
        } else {
            anObject = [(NSDictionary *) anObject objectForKey:aKey];
        }
    }
    return anObject;
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