//
//  PresidentDetails.h
//  MDF1_week4
//
//  Created by Scott Caruso on 2/27/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PresidentDetails : UIViewController <NSXMLParserDelegate>
{
    //Outlets for the various objects on the page
    IBOutlet UIImageView *presidentPicture;
    IBOutlet UITextView *presidentDetails;
    IBOutlet UILabel *presidentName;
    
    //Pointers to control the URL/XML request to pull down Presidential details
    NSURLRequest *getPresidentDetail;
    NSURL *url;
    NSURLConnection *connection;
    NSMutableData *presidentDetailObject;
}

-(IBAction)returnToList:(id)sender;
@property (nonatomic) NSString *nameOfPresident;
@property (nonatomic) IBOutlet UIImageView *presidentPicture;
@property (nonatomic) NSString *presidentDetailURL;

@end
