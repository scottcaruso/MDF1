//
//  TableViewController.h
//  MDF1_week2
//
//  Created by Scott Caruso on 2/11/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController <UITableViewDelegate>
{
    NSMutableArray *listOfArticles;
    NSArray *arrayOfDictionaries;
    NSDictionary *firstArticle;
    NSDictionary *secondArticle;
    NSDictionary *thirdArticle;
    NSDictionary *fourthArticle;
    NSDictionary *fifthArticle;
    NSDictionary *thisDictionary;
}

@end
