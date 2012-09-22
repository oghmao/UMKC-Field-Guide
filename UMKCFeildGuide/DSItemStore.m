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
        allItems = [[NSMutableArray alloc]init];
    }
    
    return self;
}

-(NSArray*) allItems{
    return allItems;
}

-(DSItem*) createItem{
    DSItem* p = [DSItem randomItem];
    
    [allItems addObject:p];
    
    NSSortDescriptor *sorter = [[NSSortDescriptor alloc] initWithKey:@"bldgName" ascending:YES];
    [allItems sortUsingDescriptors:[NSArray arrayWithObject:sorter]];
    
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

@end
