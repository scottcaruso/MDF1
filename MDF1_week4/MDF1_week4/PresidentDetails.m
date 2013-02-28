//
//  PresidentDetails.m
//  MDF1_week4
//
//  Created by Scott Caruso on 2/27/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import "PresidentDetails.h"

@interface PresidentDetails ()

@end

@implementation PresidentDetails
@synthesize nameOfPresident,presidentDetailURL,presidentPicture;

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
    //fetch the govtrack xml data
    NSString *fetchString = [[NSString alloc] initWithFormat:@"http://www.govtrack.us%@?format=xml",presidentDetailURL];
    url = [[NSURL alloc] initWithString:fetchString];
    NSLog(@"%@",url);
    getPresidentDetail = [[NSURLRequest alloc] initWithURL:url];
    if (getPresidentDetail != nil)
    {
        connection = [[NSURLConnection alloc] initWithRequest:getPresidentDetail delegate:self];
        presidentDetailObject = [NSMutableData data];
        [self connection:connection didReceiveData:presidentDetailObject];
        [self connectionDidFinishLoading:connection];  
    }
    presidentName.text = nameOfPresident;
    if ([nameOfPresident isEqualToString:@"George Washington"])
    {
        NSString *imageString = [[NSString alloc] initWithFormat:@"%@.png",nameOfPresident];
        UIImage *image = [UIImage imageNamed:imageString];
        [presidentPicture setImage:image];
    } else
    {
        NSString *imageString = [[NSString alloc] initWithFormat:@"%@.jpg",nameOfPresident];
        UIImage *image = [UIImage imageNamed:imageString];
        [presidentPicture setImage:image];
    }
    [super viewDidLoad];
	// Do any additional setup after loading the view.
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
        [presidentDetailObject appendData:data];
    }
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *xmlString = [[NSString alloc] initWithData:presidentDetailObject encoding:NSUTF8StringEncoding];
    presidentDetails.text = xmlString;
}

-(IBAction)returnToList:(id)sender
{
    [self dismissViewControllerAnimated:TRUE completion:nil]; //dismiss the ViewController and return to the main view
}

@end
