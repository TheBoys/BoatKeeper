//
//  bpSearchViewController.h
//  Marine_Keeper
//
//  Created by Simon Peacock on 4/05/13.
//  Copyright (c) 2013 TheBoys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface bpSearchViewController : UIViewController <UITextFieldDelegate> {
    
}

@property (weak, nonatomic) IBOutlet UITextView *searchResults;

@end