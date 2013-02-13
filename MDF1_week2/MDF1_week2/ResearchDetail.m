//
//  ResearchDetail.m
//  MDF1_week2
//
//  Created by Scott Caruso on 2/12/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import "ResearchDetail.h"

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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)returnToList:(id)selector
{
    [self dismissViewControllerAnimated:TRUE completion:nil]; //dismiss the ViewController and return to the main view
}

@end
