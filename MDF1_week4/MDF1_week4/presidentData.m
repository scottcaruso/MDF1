//
//  presidentData.m
//  MDF1_week4
//
//  Created by Scott Caruso on 2/26/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import "presidentData.h"
#import "MainTableView.h"

@implementation presidentData
@synthesize numberOfObjects, presidentTable;

-(id)init
{
    url = [[NSURL alloc] initWithString:@"http://www.govtrack.us/api/v1/person/?roles__role_type=president&format=xml"];
    getPresidentList = [[NSURLRequest alloc] initWithURL:url];
    if (getPresidentList != nil)
    {
        connection = [[NSURLConnection alloc] initWithRequest:getPresidentList delegate:self];
        presidentDataObject = [NSMutableData data];
        [self connection:connection didReceiveData:presidentDataObject];
        [self connectionDidFinishLoading:connection];
    }
    return self;
}

//Do stuff when the data is received.
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
    MainTableView.numberOfObjects = self.numberOfObjects;
    [presidentTable reloadData];
    /*NSString *requestString = [[NSString alloc] initWithData:presidentData encoding:NSASCIIStringEncoding];
     
     if (requestString != nil)
     {
     NSLog(@"%@",requestString);
     }*/
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    NSString *currentElement = [[NSString alloc] initWithString:elementName];
    NSString *objectsName = [[NSString alloc] initWithFormat:@"object"];
    if ([currentElement isEqualToString:objectsName])
    {
        self.numberOfObjects++;
    }
}

@end
