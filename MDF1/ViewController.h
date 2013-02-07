//
//  ViewController.h
//  MDF1
//
//  Created by Scott Caruso on 2/5/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate>
{
    IBOutlet UITableView *baseballPlayers; //outlet for the table view
    IBOutlet UIButton *editButton;
    NSArray *listOfPlayers; //this is the array of player names for the list
}

-(IBAction)onEditClick:(id)sender;

@end
