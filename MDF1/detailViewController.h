//
//  detailViewController.h
//  MDF1
//
//  Created by Scott Caruso on 2/6/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailViewController : UIViewController
{
    
}
@property (nonatomic, retain) IBOutlet UILabel *detailPlayerName;
@property (nonatomic, retain) IBOutlet UILabel *detailPlayerPosition;

-(IBAction)returnToMain:(id)sender; //dismiss the detailView

@end
