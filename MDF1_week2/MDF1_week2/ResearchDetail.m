//
//  ResearchDetail.m
//  MDF1_week2
//
//  Created by Scott Caruso on 2/12/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import "ResearchDetail.h"
#import "AppDelegate.h"

@interface ResearchDetail ()

@end

@implementation ResearchDetail

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    //Access the AppDelegate and set the background color based on the value saved
    AppDelegate *accessAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if (accessAppDelegate.backgroundColorTag == 0)
    {
        self.view.backgroundColor = [UIColor whiteColor];
    } else if (accessAppDelegate.backgroundColorTag == 1)
    {
        self.view.backgroundColor = [UIColor blueColor];
    } else if (accessAppDelegate.backgroundColorTag == 2)
    {
        self.view.backgroundColor = [UIColor orangeColor];
    } else
    {
        //do nothing
    }
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Dismiss this view and return to the listview
-(IBAction)returnToList:(id)selector
{
    [self dismissViewControllerAnimated:TRUE completion:nil]; //dismiss the ViewController and return to the main view
}

@end
