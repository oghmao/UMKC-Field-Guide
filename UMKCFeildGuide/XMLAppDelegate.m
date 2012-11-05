//
//  XMLAppDelegate.m
//  UMKCFeildGuide
//
//  Created by David Scott on 11/4/12.
//  Copyright (c) 2012 David Scott. All rights reserved.
//

#import "XMLAppDelegate.h"
#import "XMLParser.h"

@implementation XMLAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    NSString *xmlPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"xml"];
    NSData *xmlData = [NSData dataWithContentsOfFile:xmlPath];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
    
    //Initialize the delegate.
    XMLParser *parser = [[XMLParser alloc] initXMLParser];
    
    //Set delegate
    [xmlParser setDelegate:parser];
    
    //Start parsing the XML file.
    BOOL success = [xmlParser parse];
    
    if(success)
        NSLog(@"No Errors");
    else
        NSLog(@"Error Error Error!!!");
}

@end
