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
    NSMutableArray *listOfRestaurants;
    NSDictionary *listOfDictionaries;
    NSDictionary *listOfRestaurantNames;
}

-(NSMutableArray*)getRestaurantList; //method that retrieves the list of restaurants from this object
-(NSDictionary*)getListOfDictionaries; //get the dictionary of full restaurant data
-(NSDictionary*)getDictionaryForItem:(NSString*)arrayLocation; //retrieve a specific location's dictionary value using a provided key
-(NSDictionary*)getRestaurantNames; //method that retrieves the dictionary of restaurant names from this object
-(void)updateRestaurantArray:(NSMutableArray*)restaurants; //method that updates this object with a new array when changes are mode

@end
