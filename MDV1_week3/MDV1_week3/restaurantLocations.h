//
//  restaurantLocations.h
//  MDV1_week3
//
//  Created by Scott Caruso on 2/19/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface restaurantLocations : NSObject
{
    NSMutableArray *listOfRestaurants;
    NSDictionary *miami;
    NSDictionary *orlando;
    NSDictionary *dallas;
    NSDictionary *phoenix;
    NSDictionary *losAngeles;
    NSDictionary *sanFrancisco;
    NSDictionary *minneapolis;
    NSDictionary *scranton;
    NSDictionary *hartford;
    NSDictionary *boston;
    NSDictionary *listOfDictionaries;
    NSDictionary *listOfRestaurantNames;
}

-(NSMutableArray*)getRestaurantList;
-(NSDictionary*)getListOfDictionaries;
-(NSDictionary*)getDictionaryForItem:(NSString*)arrayLocation;
-(NSDictionary*)getRestaurantNames;

@end
