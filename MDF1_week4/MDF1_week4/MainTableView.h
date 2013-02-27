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
    NSURLRequest *getPresidentList;
    NSURL *url;
    NSURLConnection *connection;
    
    NSMutableData *presidentDataObject;
    IBOutlet UITableView *presidentTable;
    
    NSString *currentElement;
    
    NSMutableString *presidentFirstName;
    NSMutableString *presidentLastName;
}

@property (nonatomic) int numberOfObjects;
@property (nonatomic) int rows;
@property (nonatomic) NSMutableArray *presidentNames;
@property (nonatomic) BOOL alreadyDone;

@end
