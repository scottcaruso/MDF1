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

-(IBAction)backButtonClick:(id)sender
{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

-(void)receiveNameLatLonValues:(float)lat lon:(float)lon name:(NSString*)name
{
    MKCoordinateSpan mapSpan;
    mapSpan.latitudeDelta = 3.0f;
    mapSpan.longitudeDelta = 3.0f;
    
    CLLocationCoordinate2D mapCenter;
    mapCenter.latitude = lat;
    mapCenter.longitude = lon;
    
    MKCoordinateRegion mapRegion;
    mapRegion.span = mapSpan;
    mapRegion.center = mapCenter;
    
    [detailMap setRegion:mapRegion];
    
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
