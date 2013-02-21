//
//  SecondViewController.h
//  MDV1_week3
//
//  Created by Scott Caruso on 2/18/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "restaurantLocations.h"
#import "tableViewController.h"

@interface mapController : UIViewController <MKMapViewDelegate>
{
    IBOutlet MKMapView *appMap;
}

//prepare mapController to accept the custom object properties from the tableview
@property restaurantLocations *locations;
@property NSMutableArray *listOfRestaurants;


@end
