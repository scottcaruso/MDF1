//
//  mapController.m
//  MDV1_week3
//
//  Created by Scott Caruso on 2/18/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import "mapController.h"
#import "mapNotes.h"
#import "restaurantLocations.h"
#import "tableViewController.h"

@interface mapController ()

@end

@implementation mapController

- (void)viewDidLoad
{
    restaurantLocations *locations = [[restaurantLocations alloc] init];
    NSMutableArray *currentList = [locations getRestaurantList];
    int numberOfItems = [currentList count];
    for (int x = 0; x < numberOfItems; x++)
    {
        NSDictionary *thisDictionary = [locations getDictionaryForItem:[currentList objectAtIndex:x]];
        NSLog(@"%@",thisDictionary);
        //CLLocationCoordinate2D thisLoc;
        //thisLoc.latitude = *lat
        //thisLoc.longitutde = *lon;
        
    }
    
    /*CLLocationCoordinate2D orlandoloc;
    orlandoloc.latitude = 28.55f;
    orlandoloc.longitude = -81.33f;
    mapNotes *thisMapNote = [[mapNotes alloc] initWithTitle:@"Orlando,FL" coord:orlandoloc];
    if (thisMapNote != nil)
    {
        [appMap addAnnotation:thisMapNote];
    }*/
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
