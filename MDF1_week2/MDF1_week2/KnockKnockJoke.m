//
//  KnockKnockJoke.m
//  MDF1_week2
//
//  Created by Scott Caruso on 2/13/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import "KnockKnockJoke.h"
#import "AppDelegate.h"

@interface KnockKnockJoke ()

@end

@implementation KnockKnockJoke

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
