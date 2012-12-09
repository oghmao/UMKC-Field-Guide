//
//  DSItemStore.h
//  UMKCFeildGuide
//
//  Created by David Scott on 9/20/12.
//  Copyright (c) 2012 David Scott. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@class DSItem;

@interface DSItemStore : NSObject <CLLocationManagerDelegate, NSXMLParserDelegate>{
    NSMutableArray* allItems;
    CLLocationManager* userLocationManager;
    NSMutableString* element;
    
    double lat, lon;
    NSString* bldg;
    NSString* room, *name, *description, *type;
    int floor;
}

+(DSItemStore*) sharedStore;
-(NSMutableArray*) allItems;
-(DSItem*) createItem;
-(void) removeItem:(DSItem*) p;
-(void) moveItemsAtIndex:(int) from
                 toIndex:(int) to;

@end
