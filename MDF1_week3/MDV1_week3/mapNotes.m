//
//  mapNotes.m
//  MDV1_week3
//
//  Created by Scott Caruso on 2/19/13.
//  Copyright (c) 2013 Scott Caruso. All rights reserved.
//

#import "mapNotes.h"

@implementation mapNotes
@synthesize title,coordinate;

-(id)initWithTitle:(NSString*)text coord:(CLLocationCoordinate2D)coord
{
    if (self == [super init])
    {
        title = text;
        coordinate = coord;
    }
    return self;
}

@end
