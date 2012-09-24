//
//  DSItem.m
//  UMKCFeildGuide
//
//  Created by David Scott on 9/19/12.
//  Copyright (c) 2012 David Scott. All rights reserved.
//

#import "DSItem.h"

@implementation DSItem

@synthesize itemName, latitude, longitude, bldgName, floorNumber, roomName, buildingString, isInTable, location;

+(DSItem*) randomItem{
    
    int randomBldg = rand() % 5;
    
    DSItem* newItem = [[DSItem alloc] initWithItemName:@"Random Location" lat:(rand() % 39) lon:(-1 * (rand() % 150)) bldg:randomBldg room:[NSString stringWithFormat:@"%i",(rand() % 50)] floor:3];
    
    return newItem;
}

- (id)init
{
    return [self initWithItemName:@"Possession"
                              lat:0.0
                              lon:0.0
            bldg:0 room:@"N/A" floor:0];
}

- (id)initWithItemName:(NSString *)name
                   lat:(double) lat
                   lon:(double) lon
                  bldg:(BuildingName) bldg
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
        
        switch (bldgName) {
            case 0:
                [self setBuildingString:@"Flarsheim"];
                break;
            case 1:
                [self setBuildingString:@"Haag"];
                break;
            case 2:
                [self setBuildingString:@"Royal"];
                break;
            case 3:
                [self setBuildingString:@"Katz"];
                break;
            case 4:
                [self setBuildingString:@"Scofield"];
                break;
                
            default:
                break;
        }
        [self setIsInTable:NO];
        location = CLLocationCoordinate2DMake(latitude, longitude);
    }
    
    // Return the address of the newly initialized object
    return self;
}

@end
