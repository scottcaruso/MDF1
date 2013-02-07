//
//  detailViewController.m
//  MDF1
//
//  Created by Scott Caruso on 2/6/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import "detailViewController.h"

@interface detailViewController ()

@end

@implementation detailViewController

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)returnToMain:(id)sender
{
    [self dismissViewControllerAnimated:TRUE completion:nil]; //dismiss the ViewController and return to the main view
}

@end
