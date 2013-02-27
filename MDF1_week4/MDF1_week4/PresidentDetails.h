//
//  PresidentDetails.h
//  MDF1_week4
//
//  Created by Scott Caruso on 2/27/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PresidentDetails : UIViewController
{
    IBOutlet UILabel *presidentName;
    IBOutlet UITextView *presidentDetails;
    IBOutlet UIImageView *presidentPicture;
}

-(IBAction)returnToList:(id)sender;

@end
