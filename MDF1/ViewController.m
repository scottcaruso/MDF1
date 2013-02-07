//
//  ViewController.m
//  MDF1
//
//  Created by Scott Caruso on 2/5/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import "ViewController.h"
#import "customPlayerCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    listOfPlayers = [[NSArray alloc] initWithObjects:
                     @"Evan Longoria",
                     @"David Price",
                     @"Sam Fuld",
                     @"Desmond Jennings",
                     @"Brandon Guyer",
                     @"Matt Joyce",
                     @"Ben Zobrist",
                     @"Sean Rodriguez",
                     @"Yunel Escobar",
                     @"Kelly Johnson",
                     @"James Loney",
                     @"Ryan Roberts",
                     @"Robinson Chirinos",
                     @"Chris Gimenez",
                     @"Chris Archer",
                     @"Alex Cobb",
                     @"Jeremy Hellickson",
                     @"Matt Moore",
                     @"Fernando Rodney",
                     @"Kyle Farnsworth",
                     nil];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//This creates the rows for the ViewController table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [listOfPlayers count];
}

//This feeds the data for the table view
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    customPlayerCell *thisCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (thisCell == nil)
    {
        //thisCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        NSArray* views = [[NSBundle mainBundle] loadNibNamed:@"customPlayerView" owner:nil options:nil];
        
        for (UIView *view in views)
        {
            if([view isKindOfClass:[customPlayerCell class]])
            {
                thisCell = (customPlayerCell*)view;
            }
        }
    }
    
    //thisCell.textLabel.text = [listOfPlayers objectAtIndex:indexPath.row];
    
    return thisCell;
}

//The function to pull up the remove buttons
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableVieweditingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

//Bring up the remove buttons in the list
-(IBAction)onEditClick:(id)sender
{
    [baseballPlayers setEditing:TRUE];
}

//Handle selection of a row in the tableView
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Row selected = %d",indexPath.row);
}

@end
