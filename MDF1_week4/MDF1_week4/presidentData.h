//
//  presidentData.h
//  MDF1_week4
//
//  Created by Scott Caruso on 2/26/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface presidentData : NSObject <NSXMLParserDelegate>
{
    NSURLRequest *getPresidentList;
    NSURL *url;
    NSURLConnection *connection;
    
    NSMutableData *presidentDataObject;
}

@property (nonatomic) int numberOfObjects;
@property (nonatomic) IBOutlet UITableView *presidentTable;

@end
