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
    return TRUE;
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