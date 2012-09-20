//
//  DSItem.m
//  UMKCFeildGuide
//
//  Created by David Scott on 9/19/12.
//  Copyright (c) 2012 David Scott. All rights reserved.
//

#import "DSItem.h"

@implementation DSItem

@synthesize itemName, latitude, longitude, bldgName, floorNumber, roomName;

+(DSItem*) randomItem{
    DSItem* newItem = [[DSItem alloc] initWithItemName:@"Random Location" lat:39.5 lon:-94.578 bldg:@"Flarsheim" room:@"350" floor:3];
    
    return newItem;
}

- (id)init
{
    return [self initWithItemName:@"Possession"
                              lat:0.0
                              lon:0.0
            bldg:@"N/A" room:@"N/A" floor:0];
}

- (id)initWithItemName:(NSString *)name
                   lat:(double) lat
                   lon:(double) lon
                  bldg:(NSString*) bldg
                  room:(NSString*) room
                 floor:(int) floor{
    
    // Call the superclass's designated initializer
    self = [super init];
    
    // Did the superclass's designated initializer succeed?
    if(self) {
        // Give the instance variables initial values
        [self setItemName:name];
        [self setLatitude:lat];
        [self setLongitude:lon];
        [self setBldgName:bldg];
        [self setFloorNumber:floor];
        [self setRoomName:room];
    }
    
    // Return the address of the newly initialized object
    return self;
}

@end
