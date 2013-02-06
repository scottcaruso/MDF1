//
//  ViewController.h
//  MDF1
//
//  Created by Scott Caruso on 2/5/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UITableView *baseballPlayers; //outlet for the table view
    
    NSArray *listOfPlayers; //this is the array of player names for the list
}

@end
