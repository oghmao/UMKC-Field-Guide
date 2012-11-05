//
//  DSItem.h
//  UMKCFeildGuide
//
//  Created by David Scott on 9/19/12.
//  Copyright (c) 2012 David Scott. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef enum{
    Flarsheim,
    Haag,
    Royal,
    Katz,
    Scofield    
}BuildingName;

@interface DSItem : NSObject{
    
}

+(DSItem*) randomItem;

- (id)initWithItemName:(NSString *)name
                   lat:(double) lat
                   lon:(double) lon
                  bldg:(BuildingName) bldg
                  room:(NSString*) room
                 floor:(int) floor;

@property (nonatomic, copy) NSString* name;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic) BuildingName bldgName;
@property (nonatomic, copy) NSString* roomName;
@property (nonatomic) int floorNumber;
@property (nonatomic, copy) NSString* buildingString;
@property (nonatomic) BOOL isInTable;
@property (nonatomic) CLLocationDistance distance;

@end
