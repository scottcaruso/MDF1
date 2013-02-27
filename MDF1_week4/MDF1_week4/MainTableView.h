//
//  MainTableView.h
//  MDF1_week4
//
//  Created by Scott Caruso on 2/25/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableView : UITableViewController <UITableViewDelegate,NSXMLParserDelegate>
{
    //pointers to grab the XML
    NSURLRequest *getPresidentList;
    NSURL *url;
    NSURLConnection *connection;
    NSMutableData *presidentDataObject;
    
    IBOutlet UITableView *presidentTable;
    
    NSString *currentElement; //used by the parser to figure out where we are in the XML
    
    NSMutableString *presidentFirstName; //used by the parser to create a string for the table
    NSMutableString *presidentLastName; //used by the parser to create a string for the table
}

@property (nonatomic) NSMutableArray *presidentNames; //create an array of the President names to pass around.

@end
