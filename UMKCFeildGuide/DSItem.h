//
//  DSItem.h
//  UMKCFeildGuide
//
//  Created by David Scott on 9/19/12.
//  Copyright (c) 2012 David Scott. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSItem : NSObject{
    
}

+(DSItem*) randomItem;

- (id)initWithItemName:(NSString *)name
                   lat:(double) lat
                   lon:(double) lon
                  bldg:(NSString*) bldg
                  room:(NSString*) room
                 floor:(int) floor;

@property (nonatomic, copy) NSString* itemName;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic, copy) NSString* bldgName;
@property (nonatomic, copy) NSString* roomName;
@property (nonatomic) int floorNumber;

@end
