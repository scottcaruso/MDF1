//
//  tableViewController.h
//  MDV1_week3
//
//  Created by Scott Caruso on 2/18/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "restaurantLocations.h"
#import "mapController.h"

@interface tableViewController : UIViewController <UITableViewDelegate>
{
    IBOutlet UITableView *restaurantDisplay;
    IBOutlet UIButton *editButton;
}

@property (readwrite, nonatomic) NSMutableArray *listOfRestaurants; //prepare the list of restaurants to pass to mapController
@property (nonatomic) restaurantLocations *locations; //prepare the locations object to pass to mapController

-(IBAction)editButtonClick:(id)sender; //activate the Edit Button on the screen
-(void)setMapControllerProperties:(restaurantLocations*)thisLocation listOfRestaurants:(NSMutableArray*)thisRestaurantList; //This is a reusable function that updates the mapController properties on demand

@end
