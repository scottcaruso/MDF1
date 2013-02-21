//
//  detailMapView.h
//  MDV1_week3
//
//  Created by Scott Caruso on 2/20/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface detailMapView : UIViewController <MKMapViewDelegate>
{
    IBOutlet MKMapView *detailMap;
    IBOutlet UIButton *backButton;
}

//allow the below properties to be passed between the tableview and the detailview
@property (nonatomic, retain) IBOutlet UILabel *locationName;
@property (nonatomic, retain) IBOutlet UILabel *locationLatitude;
@property (nonatomic, retain) IBOutlet UILabel *locationLongitude;
@property (nonatomic, retain) IBOutlet UILabel *restaurantName;
@property (nonatomic) CLLocationCoordinate2D mapCenter;
@property (nonatomic) MKCoordinateRegion mapRegion;

-(IBAction)backButtonClick:(id)sender;
-(void)receiveNameLatLonValues:(float)lat lon:(float)lon name:(NSString*)name; //sets the centerpoint and creates the mapnote for the individual location

@end
