//
//  tableViewController.m
//  MDV1_week3
//
//  Created by Scott Caruso on 2/18/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import "tableViewController.h"
#import "restaurantLocations.h"
#import "detailMapView.h"
#import "mapController.h"

@interface tableViewController ()

@end

@implementation tableViewController
@synthesize locations;
@synthesize listOfRestaurants;

- (void)viewDidLoad
{
    locations = [[restaurantLocations alloc] init]; //initialize the locations object
    listOfRestaurants = [locations getRestaurantList]; //access the restaurants array in the custom object
    [self setMapControllerProperties:locations listOfRestaurants:listOfRestaurants]; //set the mapController properties to default values
    [super viewDidLoad];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [listOfRestaurants count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [listOfRestaurants objectAtIndex:indexPath.row];
    return cell;
}

//The function to set the editing style to delete mode when editing is set to true.
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableVieweditingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

//Delete an item when the button is pressed
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [listOfRestaurants removeObjectAtIndex:indexPath.row];
        [restaurantDisplay deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:(true)];
        [locations updateRestaurantArray:listOfRestaurants]; //update the main Array by removing the deleted item
        [self setMapControllerProperties:locations listOfRestaurants:listOfRestaurants]; //update the mapController properties
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     detailMapView *mapDetail = [[detailMapView alloc] initWithNibName:@"detailMapView" bundle:nil]; //initialize the detail view for the list
     NSDictionary *locationsAndDetails = [locations getListOfDictionaries]; //get the object for the location details
     NSMutableArray *listOfLocations = [locations getRestaurantList]; //get the current list of restaurants still available
     NSDictionary *restaurantNames = [locations getRestaurantNames]; //get the list of restaurant names
     if (mapDetail != nil)
     {
         [self presentViewController:mapDetail animated:TRUE completion:nil]; //open the detail view
         NSArray *locationKeys = [locationsAndDetails allKeys]; //create an array of the keys where the restaurant details are saved
         //loop through the location keys and find a match to the current index, then fetch that data.
         for (int x = 0; x<[locationKeys count]; x++)
         {
             if ([locationKeys objectAtIndex:x] == [listOfLocations objectAtIndex:indexPath.row])
             {
                 NSString *thisObject = [[NSString alloc] initWithString:[locationKeys objectAtIndex:x]];
                 NSString *thisRestaurantName = [[NSString alloc] initWithString:[restaurantNames objectForKey:thisObject]];
                 NSDictionary *thisLocation = [locationsAndDetails valueForKey:thisObject];
                 NSNumber *latNumber = [thisLocation objectForKey:@"latitude"];
                 NSNumber *lonNumber = [thisLocation objectForKey:@"longitude"];
                 NSString *latString = [latNumber stringValue];
                 NSString *lonString = [lonNumber stringValue];
                 //set the detail list properties
                 mapDetail.restaurantName.text = thisRestaurantName;
                 mapDetail.locationName.text = thisObject;
                 mapDetail.locationLatitude.text = latString;;
                 mapDetail.locationLongitude.text = lonString;
                 float latFloat = [latNumber floatValue];
                 float lonFloat = [lonNumber floatValue];
                 [mapDetail receiveNameLatLonValues:latFloat lon:lonFloat name:thisRestaurantName]; //call the method in the detailmapview that sets the default span/centering for a unique item
            }
         }
     }
}

//make things happent when the edit button is clicked
-(IBAction)editButtonClick:(id)sender
{
    if (editButton.tag == 0) //if the editButton is in its default state, go into delete mode
    {
        [restaurantDisplay setEditing:TRUE];
        [editButton setTitle:@"Normal Mode" forState:0];
        [editButton setTitle:@"Normal Mode" forState:1];
        [editButton setTitle:@"Normal Mode" forState:2];
        editButton.tag = 1; //set the tag to non-default
    }
    else // if the button is non-default, go into normal mode
    {
        [restaurantDisplay setEditing:FALSE];
        [editButton setTitle:@"Edit List" forState:0];
        [editButton setTitle:@"Edit List" forState:1];
        [editButton setTitle:@"Edit List" forState:2];
        editButton.tag = 0; //set tag back to default
    }
}

//This is a reusable function that updates the mapController properties on demand
-(void)setMapControllerProperties:(restaurantLocations*)thisLocation listOfRestaurants:(NSMutableArray*)thisRestaurantList
{
    NSArray *views = [self.tabBarController viewControllers];
    mapController *mapView = (mapController*) [views objectAtIndex:1];
    mapView.locations = thisLocation;
    mapView.listOfRestaurants = thisRestaurantList;
}
@end
