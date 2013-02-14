//
//  FirstViewController.h
//  MDF1_week2
//
//  Created by Scott Caruso on 2/10/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController
{
    IBOutlet UILabel *welcome;
    IBOutlet UITextView *pleaseSelectExperience;
    IBOutlet UILabel *backgroundColorLabel;
    IBOutlet UILabel *fontLabel;
    IBOutlet UISegmentedControl *backgroundColor;
    IBOutlet UISegmentedControl *fontStyle;
}

- (IBAction)backgroundSwitch:(id)sender;

@end

