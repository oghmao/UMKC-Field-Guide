//
//  DSItemStore.m
//  UMKCFeildGuide
//
//  Created by David Scott on 9/20/12.
//  Copyright (c) 2012 David Scott. All rights reserved.
//

#import "DSItemStore.h"
#import "DSItem.h"

@implementation DSItemStore

+(DSItemStore*) sharedStore{
    static DSItemStore* sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
}

+(id)allocWithZone:(NSZone *)zone{
    return [self sharedStore];
}

-(id) init{
    self = [super init];
    
    if (self) {
        srand(time(NULL));
        allItems = [[NSMutableArray alloc]init];
        [userLocationManager setDelegate:self];
    }
    
    return self;
}

-(NSArray*) allItems{
    return allItems;
}

-(DSItem*) createItem{
    //[userLocationManager startUpdatingLocation];

    DSItem* p = [DSItem randomItem];
    
//    
//    CLLocation* currentLoc = userLocationManager.location;
//    CLLocation* cellLocation = [[CLLocation alloc] initWithLatitude:p.latitude longitude:p.longitude];
//    CLLocationDistance distance = [currentLoc distanceFromLocation:cellLocation];
//    [p setDistance:distance];
    
    [allItems addObject:p];
    
//    NSMutableArray* array = [[NSMutableArray alloc] initWithArray:allItems];
//    
//    NSComparator comp = ^(DSItem* a, DSItem* b){
//        if ([a distance] > [b distance]) {
//            return (NSComparisonResult)NSOrderedDescending;
//        }
//        
//        if ([a distance] < [a distance]) {
//            return (NSComparisonResult)NSOrderedAscending;
//        }
//        return (NSComparisonResult)NSOrderedSame;
//    };
//    
//    
//
//    NSUInteger newIndex = [allItems indexOfObject:p
//                                 inSortedRange:(NSRange){0, [allItems count]}
//                                       options:NSBinarySearchingInsertionIndex
//                               usingComparator:comp];
//    
//    [array insertObject:p atIndex:newIndex];
    
    
    
    return p;
}

-(void) removeItem:(DSItem*) p{
    [allItems removeObjectIdenticalTo:p];
}

-(void) moveItemsAtIndex:(int) from
                 toIndex:(int) to{
    if (from == to) {
        return;
    }
    
    DSItem* p = [allItems objectAtIndex:from];
    
    [allItems removeObjectAtIndex:from];
    [allItems insertObject:p atIndex:to];
}

-(void) dealloc{
    [userLocationManager stopUpdatingLocation];
}

@end
