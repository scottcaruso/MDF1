//
//  detailMapView.m
//  MDV1_week3
//
//  Created by Scott Caruso on 2/20/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import "detailMapView.h"
#import "mapNotes.h"

@interface detailMapView ()

@end

@implementation detailMapView

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

//return to the tableview when the back button is clicked
-(IBAction)backButtonClick:(id)sender
{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

//reusable function that sets the centerpoint and creates the mapnote for the individual location
-(void)receiveNameLatLonValues:(float)lat lon:(float)lon name:(NSString*)name
{
    MKCoordinateSpan mapSpan; //default span that all of these locations yse
    mapSpan.latitudeDelta = 1.0f;
    mapSpan.longitudeDelta = 1.0f;
    
    CLLocationCoordinate2D mapCenter; //set the map centerpoint to the passed in latitude and longitude
    mapCenter.latitude = lat;
    mapCenter.longitude = lon;
    
    MKCoordinateRegion mapRegion;
    mapRegion.span = mapSpan;
    mapRegion.center = mapCenter;
    
    [detailMap setRegion:mapRegion];
    
    //add a mapnote for this location
    if (name != nil)
    {
        mapNotes *thisMapNote = [[mapNotes alloc] initWithTitle:name coord:mapCenter];
        if (thisMapNote != nil)
        {
            [detailMap addAnnotation:thisMapNote];
        }
    }    
}

@end
