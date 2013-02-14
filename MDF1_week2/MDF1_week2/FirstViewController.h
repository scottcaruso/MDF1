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
    //Outlets for the labels and control in the Main View
    IBOutlet UILabel *welcome;
    IBOutlet UITextView *pleaseSelectExperience;
    IBOutlet UILabel *backgroundColorLabel;
    IBOutlet UISegmentedControl *backgroundColor;
}

- (IBAction)backgroundSwitch:(id)sender; //controls the background color switch

@end

