//
//  XMLParser.h
//  UMKCFeildGuide
//
//  Created by David Scott on 11/4/12.
//  Copyright (c) 2012 David Scott. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XMLAppDelegate, DSItem;

@interface XMLParser : NSObject{
    NSMutableString *currentElementValue;
    
    XMLAppDelegate *appDelegate;
    DSItem *item;
}

- (XMLParser *) initXMLParser;

@end
