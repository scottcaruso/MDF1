//
//  restaurantLocations.m
//  MDV1_week3
//
//  Created by Scott Caruso on 2/19/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import "restaurantLocations.h"

@implementation restaurantLocations

-(id)init
{
    self = [super init];
    if (self != nil)
    {
        listOfRestaurants = [[NSMutableArray alloc] initWithObjects:
                             @"Miami, FL",
                             @"Orlando, FL",
                             @"Dallas, TX",
                             @"Phoenix, AZ",
                             @"Los Angeles, CA",
                             @"San Francisco, CA",
                             @"Minneapolis, MN",
                             @"Scranton, PA",
                             @"Hartford, CT",
                             @"Boston, MA",
                             nil];
        miami = [[NSDictionary alloc] initWithObjectsAndKeys: [NSNumber numberWithFloat:25.82], @"latitude",[NSNumber numberWithFloat:80.28],@"longitude", nil];
        orlando = [[NSDictionary alloc] initWithObjectsAndKeys: [NSNumber numberWithFloat:28.43], @"latitude",[NSNumber numberWithFloat:81.42],@"longitude", nil];
        dallas = [[NSDictionary alloc] initWithObjectsAndKeys: [NSNumber numberWithFloat:32.90], @"latitude",[NSNumber numberWithFloat:97.03],@"longitude", nil];
        phoenix = [[NSDictionary alloc] initWithObjectsAndKeys: [NSNumber numberWithFloat:33.43], @"latitude",[NSNumber numberWithFloat:112.02],@"longitude", nil];
        losAngeles = [[NSDictionary alloc] initWithObjectsAndKeys: [NSNumber numberWithFloat:33.93], @"latitude",[NSNumber numberWithFloat:118.40],@"longitude", nil];
        sanFrancisco = [[NSDictionary alloc] initWithObjectsAndKeys: [NSNumber numberWithFloat:37.75], @"latitude",[NSNumber numberWithFloat:112.68],@"longitude", nil];
        minneapolis = [[NSDictionary alloc] initWithObjectsAndKeys: [NSNumber numberWithFloat:44.83], @"latitude",[NSNumber numberWithFloat:93.47],@"longitude", nil];
        scranton = [[NSDictionary alloc] initWithObjectsAndKeys: [NSNumber numberWithFloat:41.33], @"latitude",[NSNumber numberWithFloat:75.73],@"longitude", nil];
        hartford = [[NSDictionary alloc] initWithObjectsAndKeys: [NSNumber numberWithFloat:41.73], @"latitude",[NSNumber numberWithFloat:72.65],@"longitude", nil];
        boston = [[NSDictionary alloc] initWithObjectsAndKeys: [NSNumber numberWithFloat:42.37], @"latitude",[NSNumber numberWithFloat:71.03],@"longitude", nil];
        
        listOfDictionaries = [[NSDictionary alloc] initWithObjectsAndKeys:
                              miami, @"Miami, FL",
                              orlando, @"Orlando,FL",
                              dallas, @"Dallas, TX",
                              phoenix, @"Phoenix, AZ",
                              losAngeles, @"Los Angeles, CA",
                              sanFrancisco, @"San Francisco, CA",
                              minneapolis, @"Minneapolis, MN",
                              scranton, @"Scranton, PA",
                              hartford, @"Hartford, CT",
                              boston, @"Boston, MA",
                              nil];
    }
    return self;
}

-(NSMutableArray*)getRestaurantList
{
    return listOfRestaurants;
}

//Mostly for debug - gets the list of Dictionaries
-(NSDictionary*)getListOfDictionaries
{
    return listOfDictionaries;
}

-(NSDictionary*)getDictionaryForItem:(NSString*)location
{
    NSDictionary *thisDictionary = [listOfDictionaries objectForKey:location];
    return thisDictionary;
}

@end
