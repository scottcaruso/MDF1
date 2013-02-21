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
        NSNumber *lat = [thisDictionary objectForKey:@"latitude"];
        NSNumber *lon = [thisDictionary objectForKey:@"longitude"];
        int lati = [lat integerValue];
        int longi = [lon integerValue];
        CLLocationCoordinate2D thisLoc;
        thisLoc.latitude = lati;
        thisLoc.longitude = longi;
        NSString *mapTitle = [[NSString alloc] initWithString:[currentList objectAtIndex:x]];
        NSDictionary *restaurantNames = [locations getRestaurantNames];
        NSString *thisRestaurantName = [[NSString alloc] initWithString:[restaurantNames objectForKey:mapTitle]];
        if (mapTitle != nil)
        {
            mapNotes *thisMapNote = [[mapNotes alloc] initWithTitle:thisRestaurantName coord:thisLoc];
            if (thisMapNote != nil)
            {
                [appMap addAnnotation:thisMapNote];
            }
        }
    }
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
    MKCoordinateSpan mapSpan;
    mapSpan.latitudeDelta = 20.0f;
    mapSpan.longitudeDelta = 20.0f;
    
    CLLocationCoordinate2D mapCenter;
    mapCenter.latitude = 39.82f;
    mapCenter.longitude = -98.57f;
    
    MKCoordinateRegion mapRegion;
    mapRegion.span = mapSpan;
    mapRegion.center = mapCenter;
    [appMap setRegion:mapRegion];
}

@end
