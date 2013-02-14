//
//  FirstViewController.m
//  MDF1_week2
//
//  Created by Scott Caruso on 2/10/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import "FirstViewController.h"
#import "ResearchDetail.h"
#import "TableViewController.h"
#import "AppDelegate.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Controls the segment control for the background color
- (IBAction)backgroundSwitch:(id)sender {
    UISegmentedControl *thisControl = (UISegmentedControl*) sender;
    NSInteger selectedSegment = thisControl.selectedSegmentIndex;
    AppDelegate *accessAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate]; //instantiate and access the App Delegate
    if (selectedSegment == 0) {
        accessAppDelegate.backgroundColorTag = 0; //update the background color tag in the App Delegate
        self.view.backgroundColor = [UIColor whiteColor];
    }
    else if (selectedSegment == 1){
        accessAppDelegate.backgroundColorTag = 1;
        self.view.backgroundColor = [UIColor blueColor];
    }
    else if (selectedSegment == 2)
    {
        accessAppDelegate.backgroundColorTag = 2;
        self.view.backgroundColor = [UIColor orangeColor];
    } else
    {
        //Do nothing
    }
}

@end
