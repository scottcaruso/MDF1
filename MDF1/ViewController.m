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
    listOfPlayers = [[NSMutableArray alloc] initWithObjects:
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
    listOfPositions = [[NSMutableArray alloc] initWithObjects:
                     @"Third Baseman",
                     @"Pitcher",
                     @"Outfielder",
                     @"Outfielder",
                     @"Outfielder",
                     @"Outfielder",
                     @"Utility Player",
                     @"Second Base",
                     @"Shortstop",
                     @"Second Base",
                     @"First Base",
                     @"Third Base",
                     @"Catcher",
                     @"Catcher",
                     @"Pitcher",
                     @"Pitcher",
                     @"Pitcher",
                     @"Pitcher",
                     @"Pitcher",
                     @"Pitcher",
                     nil];
    [super viewDidLoad];
	//Do any additional setup after loading the view, typically from a nib.
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
        NSArray* views = [[NSBundle mainBundle] loadNibNamed:@"customPlayerView" owner:nil options:nil];
        
        for (UIView *view in views)
        {
            if([view isKindOfClass:[customPlayerCell class]])
            {
                thisCell = (customPlayerCell*)view;
                thisCell.playerName.text = [listOfPlayers objectAtIndex:indexPath.row];
                thisCell.playerPosition.text = [listOfPositions objectAtIndex:indexPath.row];
    
            }
        }
    }

    return thisCell;
}

//Bring up the remove buttons in the list when the Edit button is clicked
-(IBAction)onEditClick:(id)sender
{
    [baseballPlayers setEditing:TRUE];
}

//The function to set the editing style to delete mode when editing is set to true.
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableVieweditingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

//Handle selection of a row in the tableView
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Row selected = %d",indexPath.row);
}

//Delete an item when the button is pressed
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [listOfPlayers removeObjectAtIndex:indexPath.row];
        [listOfPositions removeObjectAtIndex:indexPath.row];
        [baseballPlayers deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:(true)];
    }
}


@end
