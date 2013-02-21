//
//  tableViewController.h
//  MDV1_week3
//
//  Created by Scott Caruso on 2/18/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface tableViewController : UIViewController <UITableViewDelegate>
{
    IBOutlet UITableView *restaurantDisplay;
}

-(IBAction)editButtonClick:(id)sender;

@end
