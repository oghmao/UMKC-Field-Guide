//
//  DSItemStore.h
//  UMKCFeildGuide
//
//  Created by David Scott on 9/20/12.
//  Copyright (c) 2012 David Scott. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DSItem;

@interface DSItemStore : NSObject{
    NSMutableArray* allItems;
    
}

+(DSItemStore*) sharedStore;
-(NSArray*) allItems;
-(DSItem*) createItem;
-(void) removeItem:(DSItem*) p;
-(void) moveItemsAtIndex:(int) from
                 toIndex:(int) to;

@end
