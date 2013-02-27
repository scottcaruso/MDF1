//
//  MainTableView.m
//  MDF1_week4
//
//  Created by Scott Caruso on 2/25/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import "MainTableView.h"
#import "PresidentDetails.h"

@interface MainTableView ()

@end

@implementation MainTableView
@synthesize presidentNames;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    //initialize the arrays and strings that will make up 
    presidentNames = [[NSMutableArray alloc] initWithObjects:nil];
    presidentFirstName = [[NSMutableString alloc] initWithFormat:@""];
    presidentLastName = [[NSMutableString alloc] initWithFormat:@""];
    
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
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [presidentNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [presidentNames objectAtIndex:indexPath.row]; //pull a President name from the array
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PresidentDetails *detailView = [[PresidentDetails alloc] initWithNibName:@"PresidentDetails" bundle:nil];
    if (detailView != nil)
    {
        [self presentViewController:detailView animated:TRUE completion:nil];
    }
}

//add the retrieved data to the main data object
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (data != nil)
    {
        [presidentDataObject appendData:data];
    }
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:presidentDataObject];
    if (parser != nil)
    {
        [parser setDelegate:self];
        [parser parse];
    }
    
    //the below makes a copy of the Presidents Array and then loops through both to remove duplicate entries.
    NSMutableArray *copyOfPresidentsArray = [presidentNames copy];
    NSInteger index = [copyOfPresidentsArray count] - 1;
    for (id object in [copyOfPresidentsArray reverseObjectEnumerator])
    {
        if ([presidentNames indexOfObject:object inRange:NSMakeRange(0, index)] != NSNotFound)
        {
            [presidentNames removeObjectAtIndex:index];
        }
        index--;
    }
    
    //Alphabetize the array and then reload the tableview so that it takes in the data
    [presidentNames sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    [presidentTable reloadData];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    currentElement = [[NSString alloc] initWithString:elementName];
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSString *firstNameID = [[NSString alloc] initWithFormat:@"firstname"];
    NSString *lastNameID = [[NSString alloc] initWithFormat:@"lastname"];
    NSString *whenToCompileString = [[NSString alloc] initWithFormat:@"bioguideid"];
    if ([currentElement isEqualToString:firstNameID])
    {
        [presidentFirstName setString:string];
    }
    if ([currentElement isEqualToString:lastNameID])
    {
        [presidentLastName setString:string];
    }
    if ([currentElement isEqualToString:whenToCompileString])
    {
        NSMutableString *presidentName = [[NSMutableString alloc] initWithString:presidentFirstName];
        [presidentName appendFormat:@" %@",presidentLastName];
        [presidentNames addObject:presidentName];
    }
}

@end
