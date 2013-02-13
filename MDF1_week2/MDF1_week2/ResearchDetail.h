//
//  ResearchDetail.h
//  MDF1_week2
//
//  Created by Scott Caruso on 2/12/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResearchDetail : UIViewController
{
    IBOutlet UIButton *returnToMain;
}

@property (nonatomic, retain) IBOutlet UILabel *articleURL;
@property (nonatomic, retain) IBOutlet UILabel *articleTitle;
@property (nonatomic, retain) IBOutlet UILabel *authorName;
@property (nonatomic, retain) IBOutlet UILabel *publication;
@property (nonatomic, retain) IBOutlet UILabel *publicationDate;
@property (nonatomic, retain) IBOutlet UITextView *abstract;

-(IBAction)returnToList:(id)selector;

@end
