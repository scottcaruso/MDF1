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
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    //initialize the arrays and strings that will make up 
    presidentNames = [[NSMutableArray alloc] initWithObjects:nil];
    linkToRecord = [[NSMutableString alloc] initWithFormat:@""];
    presidentFirstName = [[NSMutableString alloc] initWithFormat:@""];
    presidentLastName = [[NSMutableString alloc] initWithFormat:@""];
    dictionaryOfPresidents = [[NSMutableDictionary alloc] initWithObjectsAndKeys: nil];
    
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PresidentDetails *detailView = [[PresidentDetails alloc] initWithNibName:@"PresidentDetails" bundle:nil];
    if (detailView != nil)
    {
        //access the Presidents dictionary to acquire the necessary string to pull President details ont he following view.
        NSArray *presidentKey = [dictionaryOfPresidents allKeysForObject:[presidentNames objectAtIndex:indexPath.row]];
        NSString *thisURL = [presidentKey objectAtIndex:0];
        detailView.presidentDetailURL = thisURL;
        detailView.nameOfPresident = [presidentNames objectAtIndex:indexPath.row];
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
    NSString *resourceID = [[NSString alloc] initWithFormat:@"resource_uri"];
    
    if ([currentElement isEqualToString:firstNameID])
    {
        [presidentFirstName setString:string];
    }
    if ([currentElement isEqualToString:lastNameID])
    {
        [presidentLastName setString:string];
    }
    if ([currentElement isEqualToString:resourceID])
    {
        NSString *whichString = [string substringToIndex:13]; //this creates a substring to verify that we have found the correct one of the two resourceIDs
        [linkToRecord setString:string]; //sets linkToRecord to this object
        if ([whichString isEqualToString:@"/api/v1/perso"])
        {
            NSMutableString *presidentName = [[NSMutableString alloc] initWithString:presidentFirstName];
            [presidentName appendFormat:@" %@",presidentLastName];
            [presidentNames addObject:presidentName];
            [dictionaryOfPresidents setObject:presidentName forKey:linkToRecord]; //add a new key/value to the President dictionary for later
        }
    }
}

@end
