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
    IBOutlet UIButton *editButton; //outlet for the Edit Button in the main view
    NSMutableArray *listOfPlayers; //this is the array of player names for the list
    NSMutableArray *listOfPositions; //the positions that go with the players
}

-(IBAction)onEditClick:(id)sender; //performs action when Edit Button is clicked.

@end
