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

@interface tableViewController ()

@end

@implementation tableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    restaurantLocations *locations = [[restaurantLocations alloc] init];
    NSMutableArray *listOfLocations = [locations getRestaurantList];
    return [listOfLocations count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    restaurantLocations *locations = [[restaurantLocations alloc] init];
    NSMutableArray *listOfLocations = [locations getRestaurantList];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [listOfLocations objectAtIndex:indexPath.row];
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

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     detailMapView *mapDetail = [[detailMapView alloc] initWithNibName:@"detailMapView" bundle:nil];
     restaurantLocations *locations = [[restaurantLocations alloc] init];
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
@end
