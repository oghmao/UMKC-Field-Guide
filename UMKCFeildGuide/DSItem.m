//
//  DSItem.m
//  UMKCFeildGuide
//
//  Created by David Scott on 9/19/12.
//  Copyright (c) 2012 David Scott. All rights reserved.
//

#import "DSItem.h"

@implementation DSItem

@synthesize typeString, name, latitude, longitude, bldgName, floorNumber, roomName, buildingString, isInTable, distance;

+(DSItem*) randomItem{
    
    NSString* randomBldg = @"";
    
    static int name = 0;
    
    DSItem* newItem = [[DSItem alloc] initWithItemName:[NSString stringWithFormat:@"%i", name++] lat:(rand() % 39) lon:(-1 * (rand() % 150)) bldg:randomBldg room:[NSString stringWithFormat:@"%i",(rand() % 50)] type:@"Bldg" floor:3];
    
    return newItem;
}

- (id)init
{
    return [self initWithItemName:@"Possession"
                              lat:0.0
                              lon:0.0
                             bldg:0 room:@"N/A"
                             type: @"N/A"
                            floor:0];
}

- (id)initWithItemName:(NSString *)itemName
                   lat:(double) lat
                   lon:(double) lon
                  bldg:(NSString*) bldg
                  room:(NSString*) room
                  type:(NSString*) t
                 floor:(int) floor{
    
    // Call the superclass's designated initializer
    self = [super init];
    
    // Did the superclass's designated initializer succeed?
    if(self) {
        // Give the instance variables initial values
        [self setName:itemName];
        [self setLatitude:lat];
        [self setLongitude:lon];
        [self setBldgName:bldg];
        [self setFloorNumber:floor];
        [self setTypeString:t];
        [self setRoomName:room];
        
        [self setIsInTable:NO];
    }
    
    // Return the address of the newly initialized object
    return self;
}

@end
