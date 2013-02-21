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
    locations = [[restaurantLocations alloc] init];
    listOfRestaurants = [locations getRestaurantList];
    NSArray *views = [self.tabBarController viewControllers];
    mapController *mapView = (mapController*) [views objectAtIndex:1];
    mapView.locations = locations;
    mapView.listOfRestaurants = listOfRestaurants;
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

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
        [locations updateRestaurantArray:listOfRestaurants];
        NSArray *views = [self.tabBarController viewControllers];
        mapController *mapView = (mapController*) [views objectAtIndex:1];
        mapView.locations = locations;
        mapView.listOfRestaurants = listOfRestaurants;
        
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     detailMapView *mapDetail = [[detailMapView alloc] initWithNibName:@"detailMapView" bundle:nil];
     NSDictionary *locationsAndDetails = [locations getListOfDictionaries];
     NSMutableArray *listOfLocations = [locations getRestaurantList];
     NSDictionary *restaurantNames = [locations getRestaurantNames];
     if (mapDetail != nil)
     {
         [self presentViewController:mapDetail animated:TRUE completion:nil];
         NSArray *locationKeys = [locationsAndDetails allKeys];
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
                 mapDetail.locationName.text = thisObject;
                 mapDetail.locationLatitude.text = latString;;
                 mapDetail.locationLongitude.text = lonString;
                 float latFloat = [latNumber floatValue];
                 float lonFloat = [lonNumber floatValue];
                 [mapDetail receiveNameLatLonValues:latFloat lon:lonFloat name:thisRestaurantName];
            }
         }
     }
}


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

@end
