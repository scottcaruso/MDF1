//
//  mapNotes.h
//  MDV1_week3
//
//  Created by Scott Caruso on 2/19/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface mapNotes : NSObject <MKAnnotation>
{
    NSString *title;
    CLLocationCoordinate2D coordinate;
}

//prepare the mapnote object to accept a provided title and coordinates
@property (nonatomic) NSString *title;
@property (nonatomic) CLLocationCoordinate2D coordinate;

-(id)initWithTitle:(NSString*)text coord:(CLLocationCoordinate2D)coord; //method to initialize the mapnote with a provided title
@end
