//
//  XMLParser.m
//  UMKCFeildGuide
//
//  Created by David Scott on 11/4/12.
//  Copyright (c) 2012 David Scott. All rights reserved.
//

#import "XMLParser.h"

@implementation XMLParser

//XMLParser.m
- (XMLParser *) initXMLParser {
    
    self = [super init];
    
    appDelegate = (XMLAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict {
    
    if([elementName isEqualToString:@"locations"]) {
        //Initialize the array.
        appDelegate.items = [[NSMutableArray alloc] init];
    }
    else if([elementName isEqualToString:@"Book"]) {
        
        //Initialize the book.
        item = [[DSItem alloc] init];
        
        //Extract the attribute here.
        aBook.bookID = [[attributeDict objectForKey:@"id"] integerValue];
        
        NSLog(@"Reading id value :%i", aBook.bookID);
    }
    
    NSLog(@"Processing Element: %@", elementName);
}

@end
