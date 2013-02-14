//
//  TableViewController.h
//  MDF1_week2
//
//  Created by Scott Caruso on 2/11/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"

@interface TableViewController : UITableViewController <UITableViewDelegate>
{
    NSMutableArray *listOfArticles;
    NSArray *arrayOfDictionaries; //This creates an array of the dictionaries below for use in the for loop
    //Dictionaries for the information related to each article
    NSDictionary *firstArticle;
    NSDictionary *secondArticle;
    NSDictionary *thirdArticle;
    NSDictionary *fourthArticle;
    NSDictionary *fifthArticle;
    //This dictionary is used for specific dictionary access within the accessor method
    NSDictionary *thisDictionary;
}

@end
