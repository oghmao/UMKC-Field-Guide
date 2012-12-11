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
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"data"
                                                         ofType:@"xml"];
    
    NSXMLParser* parser = [[NSXMLParser alloc] initWithData:[[NSData alloc] initWithContentsOfFile:filePath]];
    
    [parser setDelegate:self];
    
    
    [parser setShouldProcessNamespaces:NO];
    [parser setShouldReportNamespacePrefixes:NO];
    [parser setShouldResolveExternalEntities:NO];
    
    BOOL success = [parser parse];
        
//    if(success)
//        NSLog(@"No Errors");
//    else
//        NSLog(@"Error Error Error!!!");
    
    return self;
}

-(NSArray*) allItems{
    return allItems;
}

-(DSItem*) createItem{
    DSItem* p = [DSItem randomItem];
    
    [allItems addObject:p];
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

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary*)attributeDict {
    
//    NSLog(@"Started Element %@", elementName);
    element = [NSMutableString string];
          
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    
//    NSLog(@"Found an element named: %@ with a value of: %@", elementName, element);
    
    if ([elementName isEqualToString:@"longitude"]){
        lon = [[NSString stringWithString:element] doubleValue];
    }else if ([elementName isEqualToString:@"latitude"]){
        lat = [[NSString stringWithString:element] doubleValue];
    }else if ([elementName isEqualToString:@"name"]){
        name = [NSString stringWithString:element];
    }else if ([elementName isEqualToString:@"description"]){
        description = [NSString stringWithString:element];
    }else if ([elementName isEqualToString:@"building"]){
        bldg = [NSString stringWithString:element];
    }else if ([elementName isEqualToString:@"room"]){
        room = [NSString stringWithString:element];
    }else if ([elementName isEqualToString:@"subtype"]){
        type = [NSString stringWithString:element];
    }else if ([elementName isEqualToString:@"location"]) {
        DSItem* p = [[DSItem alloc]initWithItemName:name lat:lat lon:lon bldg:bldg room:room type:type floor:floor];
        
        [allItems addObject:p];
//        NSLog(@"item added with name:%@, lat: %f, lon: %f, bldg: %@, room: %@, type: %@, floor: %i", name, lat, lon, bldg, room, type, floor);
        
    }
          
}
          
- (void)parser:(NSXMLParser*)parser foundCharacters:(NSString *)string{
    if(element == nil){
       element = [[NSMutableString alloc] init];
    }
    
    [element appendString:string];
}

@end
