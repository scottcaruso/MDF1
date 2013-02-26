//
//  MainTableView.h
//  MDF1_week4
//
//  Created by Scott Caruso on 2/25/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableView : UITableViewController
{
    NSURLRequest *getPresidentList;
    NSURL *url;
    NSURLConnection *connection;
    
    NSMutableData *presidentData;
}

@end
