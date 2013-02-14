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

- (IBAction)backgroundSwitch:(id)sender {
    UISegmentedControl *thisControl = (UISegmentedControl*) sender;
    NSInteger selectedSegment = thisControl.selectedSegmentIndex;
    AppDelegate *accessAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if (selectedSegment == 0) {
        accessAppDelegate.backgroundColorTag = 0;
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
