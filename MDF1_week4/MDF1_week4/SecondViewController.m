//
//  SecondViewController.m
//  MDF1_week4
//
//  Created by Scott Caruso on 2/25/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewWillAppear:(BOOL)animated
{
    //fetch the govtrack xml data
    url = [[NSURL alloc] initWithString:@"http://www.govtrack.us/api/v1/person/?roles__role_type=president&format=xml&limit=50"];
    getPresidentList = [[NSURLRequest alloc] initWithURL:url];
    if (getPresidentList != nil)
    {
        connection = [[NSURLConnection alloc] initWithRequest:getPresidentList delegate:self];
        presidentDataObject = [NSMutableData data];
        [self connection:connection didReceiveData:presidentDataObject];
        [self connectionDidFinishLoading:connection];
    }
    [super viewWillAppear:FALSE];
}

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

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (data != nil)
    {
        [presidentDataObject appendData:data];
    }
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *xmlString = [[NSString alloc] initWithData:presidentDataObject encoding:NSUTF8StringEncoding];
    mainTextView.text = xmlString;
}


@end
